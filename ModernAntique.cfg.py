import os

zfactor=6 # Reduce this when using high resolution data!
azimuth=315

datadir = '/Users/Kotaimen/proj/geodata'
themedir= './themes/ModernAntique'
cachedir= os.path.join(themedir, 'cache')

tag='ModernAntique'

elevation = dict(\
    prototype='datasource.dataset',
    dataset_path=os.path.join(datadir, 'srtm30_new/world_tiled.tif'),
    cache=dict(prototype='metacache',
        root=os.path.join(cachedir, 'elevation'),
        compress=True,
        data_format='gtiff',
        ),
)

diffuse = dict(\
    prototype='processing.hillshading',
    sources='elevation',
    zfactor=zfactor,
    scale=1,
    altitude=15,
    azimuth=azimuth,
    )

specular = dict(\
    prototype='processing.hillshading',
    sources='elevation',
    zfactor=zfactor,
    scale=1,
    altitude=90,
    azimuth=azimuth,
    )
    

relief = dict(\
    prototype='composite.imagemagick',
    cache=dict(prototype='metacache',
               root=os.path.join(cachedir, 'relief'),
               data_format='png',
               ),                  
    sources=['diffuse', 'specular'],
    format='png',
    command='''   
    (
        ( $1 -fill grey50 -colorize 100% )
        ( $1 ) -compose blend -define compose:args=50% -composite
        ( $2 -gamma 3 ) -compose blend -define compose:args=50% -composite     
        -gamma 0.6
    )
    '''
    )

shapes = dict(\
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-shapes.xml',
    image_type='png',
    buffer_size=0,
    scale_factor=1,
    )

labels = dict(\
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-labels.xml',
    image_type='png',
    buffer_size=128,
    scale_factor=1.15,
    )

texture = dict(\
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-texture.xml',
    image_type='png',
    buffer_size=0,
    scale_factor=1,
    )

composer = dict(\
     prototype='composite.imagemagick',
    cache=dict(prototype='metacache',
               root=os.path.join(cachedir, '%s' % tag),
               data_format='jpg',
               ),                  
     sources=['shapes', 'texture', 'labels', 'relief'],
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
#         $3 -geometry +0+3
#         -channel A -blur 16 -evaluate Multiply 0.5 +channel 
#         -channel RGB -evaluate Set 0 +channel
#         -attenuate 0.9 +noise Gaussian
#      ) -compose Over -composite
#      $3 -compose over -composite

    # Eroded text
     ( 
        $3 -paint 1 -channel A -morphology Erode Disk:1 +channel -modulate 90,110
     ) -compose Over -composite
     ( 
        $3 -channel A -morphology Erode Disk:3 +channel 
     ) -compose Over -composite

      -unsharp 0x0.4
      -attenuate 0.4 +noise Gaussian
      -brightness-contrast +3%x-1%
      -modulate 100,90
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
        levels=range(4, 10),
        format='jpg',
        buffer=64,
        tile_size=256,
        zoom=5,
        center=(35,0),
        ),
    cache=dict(prototype='filesystem',
               root=os.path.join(cachedir, 'export', '%s' % tag),
               data_format='jpg',
               simple=True
              ),    )

