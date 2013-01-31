import os

tag = 'ModernAntiqueHD'

datadir = '/Users/Kotaimen/proj/geodata'
themedir= './themes/ModernAntique'
cachedir= os.path.join('/tmp', tag, 'cache')
exportdir = os.path.join(themedir, 'cache', 'export')

zfactor=5
azimuth=315

tile_size = 512
fmt = 'jpg'

elevation = dict(\
    prototype='datasource.dataset',
    dataset_path=os.path.join(datadir, 'srtm30_new/world_tiled.tif'),
    keep_cache=False,    
    cache=dict(prototype='metacache',
        root=os.path.join(cachedir, 'elevation'),
        compress=False,
        data_format='gtiff',
        ),
    )
diffuse = dict(\
    prototype='processing.hillshading',
    sources='elevation',
    zfactor=zfactor,
    scale=1,
    altitude=35,
    azimuth=azimuth,
    )

detail = dict(\
    prototype='processing.hillshading',
    sources='elevation',
    zfactor=zfactor / 2.,
    scale=1,
    altitude=65,
    azimuth=azimuth,
)

specular = dict(\
    prototype='processing.hillshading',
    sources='elevation',
    zfactor=zfactor,
    scale=1,
    altitude=85,
    azimuth=azimuth,
    )

terrain = dict(\
    prototype='composite.imagemagick',
    sources=['diffuse', 'detail', 'specular',],
    format='jpg',
    command='''   
    (
        ( $1 -fill grey50 -colorize 100% )
        ( $1 ) -compose blend -define compose:args=50% -composite
        ( $2 -fill #003cff -tint 35  -gamma 0.8 ) -compose blend -define compose:args=30% -composite
        ( $3 -gamma 3  ) -compose blend -define compose:args=20% -composite
#         -brightness-contrast -20%x-10%
	         -gamma 0.7
         -quality 99
    )
    '''
    )

shapes = dict(\
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-shapes.xml',
    image_type='png',
    buffer_size=0,
    scale_factor=tile_size//256,
    )

labels = dict(\
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-labels.xml',
    image_type='png',
    buffer_size=tile_size//2,
    scale_factor=tile_size//256*1.2,
    )

texture = dict(\
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-texture.xml',
    image_type='png',
    buffer_size=0,
    scale_factor=tile_size//256,
    )

composer = dict(\
     prototype='composite.imagemagick',               
     sources=['shapes', 'texture', 'labels', 'terrain'],
     command=''' 
     # Land/Water
     ( $1 -paint 1 ) 
     # Relief
     ( $4 ) -compose SoftLight -composite
     # Paper texture
     ( $2 -brightness-contrast -25x+30% ) 
     -compose SoftLight -composite

     # Shadowed text
#      (
#         $3 -geometry +0+1
#         -channel A -blur 4 -evaluate Multiply 0.2 +channel 
#         -channel RGB -evaluate Set 0 +channel
#         -attenuate 0.9 +noise Gaussian
#      ) -compose Multiply -composite
#      $3 -compose over -composite

    # Eroded text
    ( 
       $3 -paint 2 -channel A -morphology Erode Disk:2 +channel -modulate 86,110
    ) -compose Over -composite
    ( 
       $3 -channel A -morphology Erode Disk:8 +channel 
    ) -compose Over -composite

#     -unsharp 0x0.4
     -attenuate 0.5 +noise Gaussian
     -brightness-contrast +3%x-1%
     -modulate 100,90,98	
     -quality 90
     ''',
     format='jpg',
     )

ROOT = dict(\
    prototype='root',
    renderer='composer',
    metadata=dict(
        tag='world',
        description='Modern Antique - Mimics a antique map',
        attribution=''),
    pyramid=dict(
        levels=range(1, 10),
        format='jpg',
        buffer=tile_size//4,
        tile_size=tile_size,
        zoom=5,
        center=(274,14),
        ),
    cache=dict(prototype='filesystem',
               root=os.path.join(exportdir, '%s' % tag),
               data_format='jpg',
               simple=True
              ),    
)

