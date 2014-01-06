// geographic/region/boundary lines

#geographic_lines[zoom>=4] {
  line-color: @boundary-color;
  line-opacity: 0.8;
  line-cap: round;
  line-clip: false;
  comp-op: color-burn;      
  [zoom<=3] {
    line-width: 2;
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

// == Bold line for morphology


#10m_admin0, #10m_disurpted {

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
  
  ::inline {
    line-color: @boundary-color;
    line-join: round;
    line-cap: round;
    line-width: 0;
    line-clip: false;
    [zoom=2] { line-width: 1; }
  	[zoom=3] { line-width: 1.5; }
  	[zoom=4] { line-width: 2; }
  	[zoom=5] { line-width: 2; }
  	[zoom=6] { line-width: 2.5; }
  	[zoom>6] { line-width: 3; }
    [featurecla='Disputed (please verify)'] {
      line-cap: butt;      
      [zoom=3] { line-dasharray:4,1; }
      [zoom=4] { line-dasharray:5,2; }
      [zoom=5] { line-dasharray:6,2; }
      [zoom=6] { line-dasharray:8,3; }
      [zoom>6] { line-dasharray:10,3; }
    }
    [featurecla='Breakaway'] {
      line-cap: butt;            
      [zoom=3] { line-dasharray: 3,2; }
      [zoom=4] { line-dasharray: 4,4; }
      [zoom=5] { line-dasharray: 5,5; }
      [zoom=6] { line-dasharray: 6,6; }
      [zoom>6] { line-dasharray: 8,8; }
    }
    [featurecla='Claim boundary'] {
      line-dasharray: 1,3;
      line-cap: butt;            
      [zoom>6] { line-dasharray: 2,4; }
    }
    [featurecla='Indefinite (please verify)'] {
      line-dasharray: 6,1;
      line-cap: butt;            
    }    
  }
 
}

#10m_admin1 {
  [zoom=3][scalerank<=2],
  [zoom=4][scalerank<=3],
  [zoom=5][scalerank<=4],
  [zoom=6][scalerank<=5],
  [zoom=7][scalerank<=7],
  [zoom>7],    
  {
    ::outline2[zoom>=4] {
      line-color: @outline-color2;
      [zoom>=2][zoom<=4] { line-width: 7; line-opacity: 0.2; }  
      [zoom>=5][zoom<=6] { line-width:9; line-opacity: 0.4; }   
      [zoom>=7] {line-width: 11; line-opacity: 0.5; }   
      [zoom>=2][zoom<=4] { image-filters: 'agg-stack-blur(4, 4)'; }    
      [zoom>=5][zoom<=6] { image-filters: 'agg-stack-blur(6, 6)';}   
      [zoom>=7] { image-filters: 'agg-stack-blur(8, 8)'; }     
      comp-op: hard-light;       
      opacity: 0.5;
    }   
    
    ::body {
      line-color: @boundary-color;
      line-join: round;
      line-cap: round;
      line-width: 0;
	  comp-op: color-burn;          
      line-clip: false;
      [zoom<=4] { line-dasharray: 4,2; }
      [zoom>=5] { line-dasharray: 6,4; }

      [zoom<=4] { line-width: 1; }
      [zoom=5] { line-width: 1.5; }
      [zoom=6] { line-width: 2; }
      [zoom>6] { line-width: 2.5; }
    }
    
  }
}
