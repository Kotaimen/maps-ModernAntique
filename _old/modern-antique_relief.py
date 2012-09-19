# Mason Configuration File
#
# Configures default mason tile server, this is actually a python script defines
# a list of layer configurations.


# A list of tile layers
LAYERS = [

# LAYER 1 ------------------------------------------------------------------

{
'tag': 'shadedrelief',
'ext': 'png',
'mimetype': 'image/png',
'levels':  range(8, 11),
'tile_size': 512,
'envelope': (-180, -65, 180, 65),
'center': (0, 0),
'crs': 'ESPG:4326',
'proj': 'ESPG:3857',
'mode': 'default',

# Data Source -=-=-=-=-=-=-=-=-=

'source': {
    'prototype': 'composer',
    'data_type': 'png',
    'command': '''
        
#        ( $1 -brightness-contrast +28%x-45% -gamma 1.3 )
#        $2
#        -compose overlay -composite
        $1
        -resize 50%x50% 
        -unsharp 0.3x0.2
    ''',
    'sources': [
        {
        'prototype': 'hillshade',
        'server': 'postgresql+psycopg2://postgres:123456@172.26.179.98:5432/world_dem_10m',
        'dem_table': 'srtm30',
        'zfactor': 1.01,
        'scale': 111120,
        'altitude': 45,
        'azimuth': 315,
        'data_type': 'gtiff',
        },
        {
        'prototype': 'colorrelief',
        'server': 'postgresql+psycopg2://postgres:123456@172.26.179.98:5432/world_dem_10m',
        'dem_table': 'srtm30',
        'color_context': r'./modern-antique_hypsometric-map.txt',
        'data_type': 'gtiff',   
        },                
    ],
    'storages': [
        None,
        None,
    ]
},

# Data Storage -=-=-=-=-=-=-=-=-=

'storage':
#         None,

    {
     'prototype': 'filesystem',
     'root': '/data/tilestorage/modern-antique_relief/relief_315_45_1',
     'ext': 'png',
     'simple': False,
    },

'metadata': {
    'Description': 'Sample GDAL Map',
    },



},


# LAYER 2 -------------------------------------------------------------------
{
'tag': 'colorrelief',
'ext': 'png',
'mimetype': 'image/png',
'levels':  range(8, 11),
'tile_size': 256,
'envelope': (-180, -65, 180, 65),
'center': (0, 0),
'crs': 'ESPG:4326',
'proj': 'ESPG:3857',
'mode': 'default',

# Data Source -=-=-=-=-=-=-=-=-=

'source': {
    'prototype': 'composer',
    'data_type': 'png',
    'command': ''' 
        $1
        ''',
    'sources': [
        {
        'prototype': 'colorrelief',
        'server': 'postgresql+psycopg2://postgres:123456@172.26.179.98:5432/world_dem_10m',
        'dem_table': 'srtm30',
        'color_context': r'./modern-antique_hypsometric-map.txt',
        'data_type': 'gtiff',   
        },                
    ],
    'storages': [
        None,
    ]
},

# Data Storage -=-=-=-=-=-=-=-=-=

'storage':
#         None,

    {
     'prototype': 'filesystem',
     'root': '/data/tilestorage/modern-antique_relief/color',
     'ext': 'png',
     'simple': False,
    },

'metadata': {
    'Description': 'Sample GDAL Map',
    },



},

# LAYER 3 -------------------------------------------------------------------
]

