// Base layers
// - Sea
// - Landmass

@paper-color: #c7b793;
//@sea-color: #2f6955;
@sea-color: #71512b; 
@land-color: #d1af4d;
@water-color: #6e7055;
@river-color: #113d1d;
  
@outline-color: #2f1111;
@outline-color2:  #5c2f21;
@geoline-color: #e35419;
@boundary-color: #5c1500;
 
@aqua-text-face-color: #20450d;
@aqua-text-halo-color: @paper-color;
@aqua-text-regular: "Geogria Regular";
@aqua-text-bold: "Georgia Bold";
@aqua-text-italic: "Georgia Italic";
 
@land-text-face-color: #280000;
@land-text-halo-color: desaturate(@land-color, 16%);
@land-text-regular: "Baskerville SemiBold";
//@land-text-bold: "Baskerville Bold";
@land-text-bold: "Baskerville Bold";
@land-text-italic: "Baskerville SemiBold Italic";

Map { 
  //background-color: @paper-color;
  //background-color: @sea-color;

  // Set background to netual color near -180
  //background-color: #99825c;
  //font-directory: url(/Library/Fonts/);
}

// Sea -----------------------------------------------------------------
#boundingbox {
  polygon-fill: @paper-color;
}
/*
#bathymetry[DEPTH>0] {
  polygon-opacity: 0.11;
  polygon-fill:@sea-color;
}
*/
#reefs[zoom>=3] {
  line-width: 1;
  line-color: saturate(darken(@sea-color, 15%), 25%);
  line-join: round;
  line-cap: butt;
  [zoom>5] { 
    line-width: 2;
    line-dasharray: 1, 1; 
  }
}
#ice_shelve {
  line-width: 0.5;
  line-color: lighten(@sea-color, 45%);
  line-join: round;
  line-cap: butt;
  [zoom>5] { 
    line-width: 1;
    line-dasharray: 1, 1; 
  }
}

// Land -----------------------------------------------------------------

#land [ScaleRank<=1]{
  ::outline4[zoom>5] {
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
}

#land [ScaleRank>1],
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
} 

//#land, #islands { polygon-fill:black; polygon-opacity: 0.3; }
//#land, #islands { polygon-fill:white; polygon-gamma:0.5;}
