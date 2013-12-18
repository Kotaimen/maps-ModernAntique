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
    scale_factor=1
    )


label = dict(\
    prototype='node.mapnik',
    theme=os.path.join(themedir, 'antique-label.xml'),
    image_type='png',
    buffer_size=tile_size*2,
    scale_factor=1
    )
    
halo = dict(\
    prototype='node.mapnik',
    theme=os.path.join(themedir, 'antique-halo.xml'),
    image_type='png',
    buffer_size=0,
    scale_factor=1
    )
    
texture = dict(\
    prototype='node.mapnik',
    theme=os.path.join(themedir, 'antique-texture.xml'),
    image_type='png',
    buffer_size=256,
    scale_factor=1
    )
    
composer=dict(\
    prototype='node.imagemagick',

    sources=['base', 'label', 'halo', 'texture',
             ],
    format=fmt,
    command='''
    {{base}}
    {{texture}} -compose ColorBurn -composite
    ( 
        {{halo}}
        ( {{label}} -channel A -morphology EdgeOut Disk:2  +channel ) -compose DstIn -composite
    ) -compose Over -composite
    (    
        {{label}}  
        ( +clone -paint 1 -brightness-contrast 15
#        -channel A
#          -morphology HMT LineJunctions
#          -morphology Dilate Disk:1
#          +channel
        ) -compose Multiply -composite
    )  -compose Over -composite
    -quality 90
    ''' 
    
    )

ROOT = dict(\
    renderer='composer',
    metadata=dict(tag=tag,
                  version='3.0',
                  description='Modern Antique',
                  attribution='Natural Earth',
                  ),
    storage=dict(prototype='filesystem',
                 root=os.path.join('/tmp/Antique'),
                ),
    pyramid=dict(levels=range(2, 8),
                 zoom=4,
                 center=(-122.4321, 37.7702),
                 format=fmt,
                 buffer=32,
                 tile_size=tile_size,
                 ),
)

