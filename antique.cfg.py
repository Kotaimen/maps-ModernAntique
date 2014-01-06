import os

datadir = '/Users/Kotaimen/proj/geodata'
themedir= './themes/Antique'
cachedir= os.path.join(themedir, 'cache')

tag = 'antique'
tile_size = 256

fmt = 'jpg'


base = dict(\
    prototype='node.mapnik',
    theme=os.path.join(themedir, 'antique-base.xml'),
    image_type='png',
    buffer_size=0,
    scale_factor=2
    )

label = dict(\
    prototype='node.mapnik',
    theme=os.path.join(themedir, 'antique-label.xml'),
    image_type='png',
    buffer_size=tile_size*2,
    scale_factor=2
    )
    
halo = dict(\
    prototype='node.mapnik',
    theme=os.path.join(themedir, 'antique-halo.xml'),
    image_type='png',
    buffer_size=0,
    scale_factor=2
    )
    
texture = dict(\
    prototype='node.mapnik',
    theme=os.path.join(themedir, 'antique-texture.xml'),
    image_type='png',
    buffer_size=256,
    scale_factor=2
    )
    
composer=dict(\
    prototype='node.imagemagick',

    sources=['base', 'label', 'halo', 'texture',
             ],
    format=fmt,
    command='''    
    # Base shape with texture, saturation is reduced
    {{base}} -modulate 100,66 
    {{texture}} -compose ColorBurn -composite
    
    # Recuce smart haloing lightness a bit and blend with lighten, this cause
    # only dark areas got the haloing effect, calculate haloing using morphology operation
    (         
         {{halo}} -modulate 90,66
         ( {{label}} -channel A -morphology EdgeOut Disk:4 -blur 1  +channel  ) 
         -compose DstIn -composite
    ) -compose Lighten -composite
    
    # Render label as normal
    (    
        {{label}}  
        ( +clone -paint 1 -brightness-contrast 15
        ) -compose Multiply -composite
    )  -compose Over -composite
    -quality 80
    '''     
    )

ROOT = dict(\
    renderer='composer',
    metadata=dict(tag=tag,
                  dispname='Antique',
                  version='3.0',
                  description='Mimics a antique map',
                  attribution='Natural Earth II',
                  ),
    storage=dict(prototype='cluster',
               stride=16,
               servers=['localhost:11211',],
               root=os.path.join(cachedir, 'export', '%s' % tag),
              ),
    pyramid=dict(levels=range(2, 8),
                 zoom=7,
                 center=(47, -19),
                 format=fmt,
                 buffer=32,
                 tile_size=tile_size,
                 ),
)

