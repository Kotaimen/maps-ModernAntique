// Labels

#geographic_lines::label [zoom>1] { 
  text-fill: @land-text-face-color;
  text-face-name: @land-text-italic;
  text-halo-fill: @land-text-halo-color;
  text-halo-radius: 1;
  text-allow-overlap: false;
  text-name: "[Name]";
  text-character-spacing: 2;
  text-size: 12;    
  text-dy: -8;
  text-placement:line;
  text-spacing: 768;
}

#ocean_names[zoom>2] {
  text-fill: @aqua-text-face-color;
  text-face-name: @aqua-text-bold;
  text-halo-fill: @aqua-text-halo-color;
  text-halo-radius: 1.5;
  text-allow-overlap: false;
  text-placement: interior;  
//  text-label-position-tolerance:10;
  text-name:"''";     
  text-wrap-width:15;
  
  [ScaleRank=0][zoom<=3] {
    text-name: "[Name]";
    text-size:13;
    text-character-spacing: 2;      
    text-line-spacing:3;  
    text-transform: uppercase;      
  }
  [ScaleRank=0][zoom>3] {
    text-name: "[Name]";
    text-size:12;
    text-character-spacing: 2;      
    text-line-spacing:3;  
    text-transform: uppercase;      
  }
  [ScaleRank=1][zoom>3] {
    text-name: "[Name]";
    text-size:11;
    text-line-spacing:2;  
    text-transform: uppercase;      
  }
  [ScaleRank>1][ScaleRank<4][zoom>4] {
    text-face-name: @aqua-text-italic;      
    text-name: "[Name]";
    text-size:11;
    text-line-spacing:2;  
  }
  [ScaleRank>4][zoom>6] {
    text-face-name: @aqua-text-italic;      
    text-name: "[Name]";
    text-size:11;
    text-line-spacing:1;  
  }
}

#country_names[zoom>2] {
  text-face-name: @land-text-bold;
  text-fill: @land-text-face-color;
  text-halo-fill: @land-text-halo-color;
  text-size:14;      
  text-halo-radius: 2;
  text-allow-overlap: false;
  text-min-distance: 10;
//  text-label-position-tolerance:10;
  text-name: "''";
  text-transform: uppercase;   
  text-wrap-width:25;
  text-character-spacing:1;  
  text-line-spacing:2;  
  [LabelRank<=2][zoom=2] {
    text-name: "[ABBREV]";
    text-size:12;      
  }
  [LabelRank<=3][zoom=3] {
    text-name: "[ABBREV]";
    text-size:12;          
  } 
  [LabelRank<=4][zoom=4] {
    text-name: "[NAME]";
    text-size:12;    
    text-character-spacing:2; 
  }
  [LabelRank<=5][zoom=5] {
    text-name: "[NAME]";
    text-character-spacing:3;
    text-line-spacing:1;
  }
  [LabelRank<9][zoom>5][zoom<=7] {
    text-name: "[NAME]";
    text-size:14;
    text-wrap-width:40;    
    text-character-spacing:4;
    text-line-spacing:5;
  } 
  [zoom>7] {
    text-name: "[NAME_FORMA]";
    text-size:14;
    text-wrap-width:40;    
    text-character-spacing:4;
    text-line-spacing:5;
  } 

}

#lake_names{
  text-face-name: @aqua-text-italic;
  text-fill: darken(@aqua-text-face-color, 5%);
  text-halo-fill: darken(@aqua-text-halo-color, 10%);
  text-size:12;      
  text-halo-radius: 1.5;
  text-allow-overlap: false;
  text-label-position-tolerance:10;
  text-name: "''";
  text-wrap-width:20;
  text-character-spacing:1;  
  text-line-spacing:2;   
  
  [zoom>3][zoom<=5][ScaleRank<1] {
    text-size:11;      
    text-name: "[Name]";
    text-character-spacing:0;      
  }
  [zoom>5][zoom<=7][ScaleRank<=4] {
    text-size:12;      
    text-name: "[Name]";
  }
  [zoom>7][ScaleRank<10]{
    text-size:12;      
    text-name: "[Name]";    
  }
}

#cities::captial[ADM0CAP=1][zoom>3] {
  shield-name: "[NAME]";
  shield-fill:  saturate(lighten(@land-text-face-color, 10), 10);
  shield-face-name: @land-text-bold;
  shield-size: 13;
  shield-placement: point; 
  shield-halo-fill: @land-text-halo-color;
  shield-halo-radius: 1.5;
  shield-text-dy: -13;
  shield-min-distance: 5;
  shield-character-spacing: 1;  
  shield-wrap-width: 40;
  shield-file: url(markers/star-10.png);
}


#cities::foo[SCALERANK<6][ADM0CAP!=1][zoom>6] {     
  text-name: "[NAME]";
  text-fill:  lighten(@land-text-face-color, 10);
  text-face-name: @land-text-regular;
  text-size: 12;
  text-placement: point;
  text-halo-fill: @land-text-halo-color;
  text-halo-radius: 1.5;
  text-dy: -7;
  text-min-distance: 5;
  text-wrap-width: 25;
  point-file: url(markers/circle-7.png); 
}

#elvation_points[zoom>4][Name!=''] {
  text-name: "''";
  text-face-name: @aqua-text-italic;
  text-fill: @land-text-face-color;
  text-halo-fill: @land-text-halo-color;
  text-halo-radius: 1.5;
  text-size: 10;
  text-wrap-width: 25;
  text-min-distance: 10;
  [zoom<7][ScaleRank<=4] {
    text-name: "[Name]+' ('+[Elevation]+'m)'";
    text-size:11; 
  }  
  [zoom>=7][ScaleRank<8] {
    text-name: "[Name]+' ('+[Elevation]+'m)'";
    text-size:12; 
  }
}
