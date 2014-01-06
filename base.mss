// Color Palette

@paper-color: #c7b793;
@sea-color: #77340a;
@land-color: #b89f5f;
@water-color: #6e7044;
@river-color: #113d1d;
  
@outline-color: #2f1111;
@outline-color2:  #5c2f21;
@boundary-color: #5c1500;

@aqua-text-face-color: #0f2205;
@aqua-text-halo-color: @paper-color;
@aqua-text-regular: "Georgia Bold Italic";
 
@land-text-face-color: #280000;
@land-text-halo-color: desaturate(@land-color, 16%);
@land-text-regular: "Baskerville SemiBold Italic";
//@land-text-bold: "Baskerville Bold";
@land-text-bold: "Georgia Bold";
@land-text-italic: "Baskerville SemiBold Italic";

Map { 
//  background-image: url("textures/antique_paper.jpg");
    buffer-size: 0;
}

// Sea -----------------------------------------------------------------

#boundingbox {
  polygon-pattern-file:url("textures/antique_paper.jpg");
  polygon-pattern-alignment: local;
  polygon-pattern-clip: false;
}

#bathymetry {
  polygon-opacity: 0.1;
  image-filters: 'agg-stack-blur(4, 4)';
  polygon-fill: @sea-color;
  polygon-comp-op: multiply;
}

// Land -----------------------------------------------------------------

#land[ScaleRank<=1] {

  ::outline4[zoom>=4] {
    line-color: @outline-color2;
    [zoom>=2][zoom<=4] { line-width: 7; line-opacity: 0.6; }  
    [zoom>=5][zoom<=6] { line-width:9; line-opacity: 0.8; }   
    [zoom>=7] {line-width: 11; line-opacity: 1; }   
    [zoom>=2][zoom<=4] { image-filters: 'agg-stack-blur(9, 9)'; }    
    [zoom>=5][zoom<=6] { image-filters: 'agg-stack-blur(16, 16)';}   
    [zoom>=7] { image-filters: 'agg-stack-blur(24, 24)'; }     
    comp-op: hard-light;
  } 
  
  ::outline3[zoom>=4] {
    line-color: @outline-color2;
    line-opacity: 0.75;
    line-join: round;
    line-cap: round;  
    [zoom>=3][zoom<5] { line-width: 7;}    
    [zoom>=5][zoom<7] { line-width: 9;}
    [zoom>=7] { line-width: 11;}
  }
  
  ::outline[zoom>0] {
    line-color: @outline-color;
    line-join: round;
    line-cap: round;  
    [zoom<3] { line-width: 2;}
    [zoom>=3][zoom<5] { line-width: 3;}    
    [zoom>=5][zoom<7] { line-width: 5;}
    [zoom>=7] { line-width: 7;}
  }
  
  ::fill {
    polygon-opacity:1;
    polygon-fill: @land-color;
    line-color: @land-color;
    line-width: 0.5;
    [zoom>=5] { polygon-gamma: 0.6; }    
  }
  
  ::texture {
    polygon-pattern-file:url("textures/antique_paper.jpg");
    polygon-pattern-alignment: local;
    polygon-pattern-clip: false;
    comp-op: hard-light;
  }
}

#land[ScaleRank>1],
#islands {

  ::outline[zoom>0] {
    line-color: @outline-color;
    line-join: round;
    line-cap: round;  
    [zoom<5] { line-width: 1;}    
    [zoom>=5][zoom<7] { line-width: 3;}
    [zoom>=7] { line-width: 4;}
  }

  ::fill {
    polygon-opacity:1;
    polygon-fill: @land-color;
  }  

  ::texture {
    polygon-pattern-file:url("textures/antique_paper.jpg");
    polygon-pattern-alignment: local;
    polygon-pattern-clip: false;    
    comp-op: hard-light;
  }
  
}

#coastline[scalerank<=5] {
  ::outline4[zoom>=4] {
    line-color: @outline-color2;
    [zoom>=2][zoom<=4] { line-width: 7; line-opacity: 0.6; }  
    [zoom>=5][zoom<=6] { line-width:9; line-opacity: 0.8; }   
    [zoom>=7] {line-width: 11; line-opacity: 1; }   
    [zoom>=2][zoom<=4] { image-filters: 'agg-stack-blur(16, 16)'; }    
    [zoom>=5][zoom<=6] { image-filters: 'agg-stack-blur(24, 24)';}   
    [zoom>=7] { image-filters: 'agg-stack-blur(32, 32)'; }     
    comp-op: hard-light;    
  }
  ::outline2[zoom>=4] {
    line-color: @outline-color2;
    [zoom>=2][zoom<=4] { line-width: 7; line-opacity: 0.2; }  
    [zoom>=5][zoom<=6] { line-width:9; line-opacity: 0.4; }   
    [zoom>=7] {line-width: 11; line-opacity: 0.5; }   
    [zoom>=2][zoom<=4] { image-filters: 'agg-stack-blur(4, 4)'; }    
    [zoom>=5][zoom<=6] { image-filters: 'agg-stack-blur(6, 6)';}   
    [zoom>=7] { image-filters: 'agg-stack-blur(8, 8)'; }     
    comp-op: hard-light;    
  }      
}

// polygon/line on land

#lakes[zoom>1]
{
  ::body {
    line-join: round;
    line-color: @river-color;    
    polygon-fill: @water-color;
    polygon-opacity: 0;
    line-width: 0;
    [zoom>1][zoom<=4][scalerank<=3], { 
      line-width: 2; 
	  polygon-opacity: 1;      
    }
    [zoom>4][zoom<=5][scalerank<=6], { 
      line-width: 3; 
	  polygon-opacity: 1;    
    }
    [zoom>5][scalerank<10], { 
      line-width: 4; 
	  polygon-opacity: 1;      
    }
    
  }
   
  ::shadow[zoom>=4] {
    line-join: round;
    line-color: @river-color;    
    line-width: 0;
    [zoom>1][zoom<=4][scalerank<=3], { 
      line-width: 5; 
    }
    [zoom>4][zoom<=5][scalerank<=6], { 
      line-width: 7; 
    }
    [zoom>5][scalerank<10], { 
      line-width: 9; 
    } 
    image-filters: 'agg-stack-blur(16, 16)';
    comp-op: color-burn;
    opacity: 0.2;  
  }
  
  ::texture {
    polygon-pattern-file:url("textures/antique_paper.jpg");
    comp-op: soft-light;
    polygon-pattern-alignment: local;
    polygon-pattern-clip: false;

  }
}

#rivers {
  line-join: round;
  line-color: @river-color;
  line-width: 0;
  [zoom>1][zoom<=4][scalerank<=3] {
    line-width: 1;
  }
  [zoom>4][zoom<=5][scalerank<=6] {
   line-width: 1.5;
  }
  [zoom>5][zoom<=8][scalerank<8]{
    line-width: 1.75;
  }
  [zoom>8][scalerank<11]{
    line-width: 2;
  }
}
