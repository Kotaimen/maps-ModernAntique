/*
#label_admin0[zoom>=3][zoom<=8] {
  ::text {
    text-face-name: @land-text-bold;
    text-name: '';
    text-transform: uppercase;
    [zoom=3] { text-size: 11; text-name: '[label_z3]'; }
    [zoom=4] { text-size: 14; text-name: '[label_z5]'; }
    [zoom=5] { text-size: 16; text-name: '[label_z6]'; }
    [zoom=6] { text-size: 22; text-name: '[label_z7]'; }
    [zoom>6] { text-size: 32; text-name: '[name]';
      text-character-spacing: 2;
      text-placements: 'X,28,24';
      text-placement-type: simple;
    }
    text-placement: point;
    //text-transform: uppercase;
    text-fill: @land-text-face-color;
    text-label-position-tolerance: 16;
//    text-halo-fill: @land-color;
//    text-halo-radius: 2;
    text-wrap-width: 125;
  }
}

//// Small islands
#10m_country[zoom>=5][zoom<=10][tiny>=2]
[name!='Brunei'] [name!='Luxemburg'] [name!='Vanuatu']
[name!='Monaco']
{
  text-name:"[name]";
  text-face-name: @land-text-bold;
  text-placement: interior;
  text-transform: uppercase;  
  text-fill: @land-text-face-color;
  text-label-position-tolerance: 16;
  text-wrap-width: 100;
  text-placement-type: simple;
  [zoom<=6] { text-size: 12; }
  [zoom>6][zoom<=7] { text-size: 16; }
  [zoom>7][zoom<=9] { text-size: 22; }
  [zoom>9] { text-size: 28; }
}

#place_static[zoom>=4][zoom<=9] {
  [layer=4][zoom=4],
  [layer=5][zoom=5],
  [layer=6][zoom=6],
  [layer=6][zoom=7],
  [layer=7][zoom=8],
  [layer=8][zoom=9], {  
    
    shield-file: url("markers/circle2.png");
    shield-unlock-image: true;
    shield-face-name: @land-text-regular;
    shield-fill: @land-text-face-color;
    
 //   shield-text-transform: uppercase;

    [font_size>=24] {
      shield-size: 20; 
      shield-text-dx: 5; 
      shield-text-dy: 5;
      shield-transform: 'scale(0.8)';
    }
    [font_size<24] {
      shield-size: 16; 
      shield-text-dx: 4; 
      shield-text-dy: 4; 
      shield-transform: 'scale(0.7)';
    }
    shield-name: '[name]';
    shield-placement-type: simple;
    shield-placement: point;
    shield-placements: 'NE,W,S'; // 'NE,SW,SE,W,N,E';
    shield-spacing: 16;
    }
}

#ne10mocean {
  //polygon-fill: red;
 // polygon-opacity: 0.4;
  ::text
    [zoom<4][scalerank<1],
    [zoom>3][zoom<6][scalerank<3],
    [zoom>=6][zoom<9][scalerank<4],
    [zoom>=9][scalerank<8], {
  text-face-name: @aqua-text-regular;
  text-name: '[name]';  
  [scalerank<2] { text-size: 14; }
  [scalerank>=2] { text-size: 12; }
  text-placement: interior;
  text-fill: @aqua-text-face-color;
  text-wrap-width: 60;
  }
}
  

#lake_labels[zoom>=6] {
  
  ::text
    [zoom=6][scalerank<=2],
    [zoom=7][scalerank<=3],
    [zoom=8][scalerank<=4],
    [zoom=9][scalerank<=5],
    [zoom>=10] {
    text-face-name: @aqua-text-regular;
    text-name: '[name]';
    text-size: 13;
    text-placement: interior;
    text-fill: @aqua-text-face-color;
    text-wrap-width: 30;
  }
}
*/