
shapes = dict(\
    name='mapnik_source',
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-shapes.xml',
    image_type='png',
    buffer_size=0,
    scale_factor=1,
    force_reload=True,
    )

labels = dict(\
    name='mapnik_source',
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-labels.xml',
    image_type='png',
    buffer_size=128,
    scale_factor=1.25,
    force_reload=True,
    )

texture = dict(\
    name='mapnik_source',
    prototype='datasource.mapnik',
    cache=None,
    theme=r'themes/ModernAntique/modern-antique-texture.xml',
    image_type='png',
    buffer_size=0,
    scale_factor=1,
    force_reload=True,
    )

composer = dict(\
     name='imagemagick_composer',
     prototype='composite.imagemagick',
     cache=None,
     sources=[shapes, texture, labels],
     command=''' 
     # Land/Water
     ( $1 -paint 1 ) 
     # Paper texture
     ( $2 -brightness-contrast -25x+30% ) 
     -compose SoftLight -composite
     # Text shadow

#      (
#         $3 -geometry +0+1 
#         -channel A -blur 8 -evaluate Multiply 0.5 +channel 
#         -channel RGB -evaluate Set 0 +channel
#         -attenuate 0.9 +noise Gaussian
#      ) -compose Over -composite
#      $3 -compose over -composite

     ( 
        $3 -paint 1 -channel A -morphology Erode Disk:2 +channel -modulate 90,110
     ) -compose Over -composite
     
     ( 
        $3 -channel A -morphology Erode Disk:3 +channel 
     ) -compose Over -composite

     -unsharp 0x0.4
     -attenuate 0.4 +noise Gaussian
     -brightness-contrast +3%x-3%
     -modulate 100,85
     ''',
     format='png',
     )

ROOT = dict(\
    name='world',
    prototype='root',
    metadata=dict(tag='world'),
    pyramid=dict(levels=range(4, 10),
                 format='png',
                 buffer=64,
                 tile_size=256,),
    cache=None,
    renderer=composer,
    )

