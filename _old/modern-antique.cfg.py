# Mason Configuration File
#
# Configures default mason tile server, this is actually a python script defines
# a list of layer configurations.

# A list of tile layers


###########################################
# Helper function
###########################################

def make_mapnik_config(xml_basename, data_type='png', buffer=32):
    return {
        'prototype': 'mapnik',
        'theme_root': '/Users/Kotaimen/Documents/MapBox/project/modern-antique-base',
        'theme_name': xml_basename,
        'data_type': data_type,
        'buffer_size': buffer,
        }

def make_filesystem_source_config(root, default):
    return {
        'prototype': 'cascade',
        'storages': [
            {
             'prototype': 'null',
            },
            {
             'prototype': 'filesystem',
             'root': root,
             'ext': 'png',
             'simple': False,
            },
            {
             'prototype': 'default',
             'filename': default,
             'ext': 'png',
            },
        ],
        }

def make_mbtiles_source_config(database, default=None):
    if default is None:
        return {
            'prototype': 'mbtiles',
            'database': database,
            'ext': 'png',
        }
    else:
        return {
            'prototype': 'cascade',
            'storages': [
                {
                 'prototype': 'null',
                },
                {
                 'prototype': 'mbtiles',
                 'database': database,
                 'ext': 'png',
                },
                {
                 'prototype': 'default',
                 'filename': default,
                 'ext': 'png',
                },
            ],
            }
def make_tile_dir(name):
    return r'/Users/Kotaimen/proj/maps/modern-antique/tile' + '/'+ name

###########################################
######## MODERN ANTIQUE MAP THEME #########
###########################################

LAYERS = [

# LAYER 1 ----------------------------------------------------------------------

{

'tag': 'worldatlas',
'ext': 'png',
'mimetype': 'image/png',
'levels':  range(0, 11),
'tile_size': 256,
'envelope': (-180, -85.06, 180, 85.06),
# 'envelope': (-100, -55, 100, 55),
'center': (0, 0),
'crs': 'ESPG:4326',
'proj': 'ESPG:3857',

# Data Source -------------------------

'source': {

    'prototype': 'composer',
    'data_type': 'png',
    'command': '''

#         (

        ######### Sea
        $1 -spread 3
        $2 -compose Over -composite
        
        ########## Sea monsters            
#         ( $15 -spread 1 -fill #6a3b30 -colorize 100% ) -compose Overlay -composite        
        ( $15 -fill #6a3b30 -colorize 100% ) -compose Multiply -composite        
        
        ######### Land outer shadow
        (
            $4 -channel A -virtual-pixel edge
            -blur 0x20 -spread 2
            -evaluate Multiply 1 -gamma 1.1
            +channel
            -fill #550c0c -colorize 100%
        ) -compose Multiply -composite

        ######### Land with inner shadow
        (
            $4
#             (
#                 $3
#                 -channel A -virtual-pixel edge -blur 0x8 -spread 2
#                 -evaluate Multiply 0.8 -gamma 1.0 +channel
#                 -fill #550c0c -colorize 100%
#             ) -compose ATop -composite
        ) -compose Over -composite

        ######### Land shaded relief
        (
            (
                (
                    $6 -brightness-contrast -11%x-65%  -gamma 1.1
                )
                (
                    $7 -brightness-contrast 0%x-8% -fill #d1af4d -colorize 55%
                )
                -compose Overlay -composite

            )
            #### Land inner shadow
            $5 -compose Copy_Opacity -composite
            (
                $3 -channel A -virtual-pixel edge -blur 0x14 -spread 2
                -evaluate Multiply 1 -gamma 1.2 +channel
                -fill #550c0c -colorize 100%
            ) -compose ATop -composite
        ) -compose Over -composite
        
        ######## Snow
        (
            $14 -channel A -spread 1 +channel 
        ) -compose Dissolve -define compose:args=25 -composite


        ######### Waters, lakes, rivers
        $9 -compose Over -composite
        (
            $10
             (
                $10 -channel A -virtual-pixel edge
                -negate
                -blur 0x12 -spread 2
                -evaluate Multiply 0.9 -gamma 0.8
                +channel
                -fill #1d2d28 -colorize 100%
            ) -compose ATop -composite
#            $10 -compose Copy_Opacity -composite
        )
        -compose Over -composite

        ######### Paper texture
        ( $8 -brightness-contrast -25x+35% ) -compose Softlight -composite

        ########## Boundary shadows
        (
            $11 -channel A -virtual-pixel edge -blur 0x8 -spread 1
            -evaluate Multiply 0.6 -gamma 0.9 +channel
            -fill #550c0c -colorize 100%
        ) -compose Multiply -composite
#         (
#             $11
#             -channel A -virtual-pixel edge -blur 0x4 -spread 1
#             -evaluate Multiply 0.7 -gamma 0.9 +channel
#             -fill #550c0c -colorize 100%
#         ) -compose Multiply -composite

        ########## Normal boundaries
        $12 -compose Over -composite
        
        ########## Shadowed text
        (
            $13 -geometry +1+1
            -channel A -virtual-pixel edge -blur 0x2
            -evaluate Multiply 0.6 -gamma 1 +channel
            -fill #984E1B -colorize 100%
        ) -compose Multiply -composite
        $13 -compose Over -composite

        ########### Post processing A
        -unsharp 0x0.4
        -attenuate 0.3 +noise Gaussian
#         -paint 6 -spread 1
#          $2 -compose Softlight -composite

#           -colorspace gray
#           -fill #926c45 -tint 59

        ########### Post processing B
        #### Halftone screen
#         -ordered-dither o4x4
#         -colorspace gray
#         -brightness-contrast -17%x-10%

#         )
        #### Eroded text
#         (
#             $6 -channel A -morphology erode cross:1 +channel -colorspace gray
#             -brightness-contrast -30%x-30% -fill black -tint 100
#         )
#         -compose Over -composite
         ''',

    'sources': [
        # 1
        make_mapnik_config('modern-antique_sea-base'),
        # 2
        make_mapnik_config('modern-antique_sea-line'),
        # 3
        make_mapnik_config('modern-antique_coastline'),
        # 4
        make_mapnik_config('modern-antique_land-base'),
        # 5
        make_mapnik_config('modern-antique_land-mask'),
        # 6
        None,
        # 7
        None,
        # 8    
        make_mapnik_config('modern-antique_overlay'),
        # 9    
        make_mapnik_config('modern-antique_waterbody'),
        # 10 
        make_mapnik_config('modern-antique_lake-mask'),
        # 11
        make_mapnik_config('modern-antique_land-line-shadow'),
        # 12
        make_mapnik_config('modern-antique_land-line'),
        # 13
        None, # make_mapnik_config('modern-antique_label'),         
        # 14
        make_mapnik_config('modern-antique_glaciated-areas'),
        # 15
        None, #make_mapnik_config('modern-antique_monsters'),
    ],
    'storages': [
        None, #1
        None, #2        
        None, #3
        None, #4
        None, #5
        #6
        make_filesystem_source_config(make_tile_dir(r'relief_315_45_2'),
                                      make_tile_dir(r'gray@256.png')),
        #7
        make_filesystem_source_config(make_tile_dir(r'color'),
                                      make_tile_dir(r'land@256.png')),
        None, #8
        None, #9
        None, #10
        None, #11 
        None, #12
        #13
        make_mbtiles_source_config(make_tile_dir(r'modern-antique_labels.mbtiles')),
        None, #14
        #15
        make_mbtiles_source_config(make_tile_dir(r'modern-antique_monsters.mbtiles'),
                                   make_tile_dir(r'transparent@256.png')),        
    ],
},

# Data Storage -=-=-=-=-=-=-=-=-=

'storage':
     None,
#     {
#      'prototype': 'filesystem',
#      'root': make_tile_dir('composition'),
#      'ext': 'png',
#      'simple': False,
#     },
'metadata': {
    'Description': 'Modern Antique World Atlas',
    'Author': 'Kotaimen, Ray'
},

}, # End of Layer 1


]

