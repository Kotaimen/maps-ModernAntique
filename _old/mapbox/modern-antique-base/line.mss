// geographic/region/boundary lines
/*
#geographic_lines {
  ::equator[Name="Equator"] {
    line-color:@paper-color;
    line-opacity: 0.7;
    [zoom<=3] {
      line-width:1;
    }
    [zoom>3] {
      line-width:3;
    }
    [zoom>5] {    
      line-width:5
    }
  } 
  line-color:@geoline-color;
  line-opacity: 0.8;
  line-cap: round;
  [zoom<=3] {
    line-width: 1;
    line-dasharray: 1, 4;
  }
  [zoom>3] {
    line-width: 3;
    line-dasharray: 1, 6;
  }
  [zoom>5] {
    line-width: 5;
    line-dasharray: 1, 9;
  }
 }

#boundary[zoom>0] {
  line-color: @boundary-color;
  line-join: round;
  line-cap: butt;

  [zoom<=2] {
    line-width: 1;
  }
  [zoom>2][zoom<=4] {
    line-width: 1.5;
  } 
  [zoom>4][zoom<=7] {
    line-width: 2;
  } 
  [zoom>7] {
    line-width: 3;
  } 
  [FeatureCla!='Treaty (please verify)'] {
    [zoom<=4] {line-dasharray: 4,1;}    
    [zoom>4] {line-dasharray: 6,2;}
  }
}

#boundary_disputed[zoom>0] {
  line-color: @boundary-color;
  line-join: round;
  line-cap: round;
  line-dasharray: 2, 3;
  [zoom<=2] {
    line-width: 1;
  }
  [zoom>2][zoom<=4] {
    line-width: 1.5;
  } 
  [zoom>4][zoom<=7] {
    line-width: 2;
  } 
  [zoom>7] {
    line-width: 3;
  } 
}
*/
// == Bold line for morphology
/*
#boundary[zoom>3]
//#boundary_disputed[zoom>3] 
{
  line-color: @outline-color2;
  line-join: round;
  line-cap: round;
  line-width: 1;
  [zoom<=2] {line-width: 4;}
  [zoom>2][zoom<=4] {line-width: 6;}  
  [zoom>4][zoom<7] {line-width:8;}   
  [zoom>=7] {line-width: 12;}   
}
*/
/*
#coastline[zoom>=4][ScaleRank<=5] {
  line-color: @outline-color2;
  line-join: round;
  line-cap: round;
  line-width: 1;
  [zoom<=2] {line-width: 4;}
  [zoom>2][zoom<=4] {line-width: 6;}  
  [zoom>4][zoom<7] {line-width:8;}   
  [zoom>=7] {line-width: 12;}   
}
*/