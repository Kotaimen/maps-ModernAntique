// polygon/line on land
/*
#lakes::shadow[zoom>1]
{
  [zoom>=5][zoom<7][ScaleRank<3]{
    polygon-fill: @water-color;    
  }
  [zoom>=7][zoom<9][ScaleRank<4]{
    polygon-fill: @water-color;    
  }
  [zoom>=9][ScaleRank<5]{
    polygon-fill: @water-color;    
  }
}
#lakes::outline[zoom>1]
{
  [zoom>1][zoom<=4][ScaleRank<=3] {
    line-join: round;
    line-color: @river-color;
    line-width: 2;
    polygon-fill: @water-color;    
  }
  [zoom>4][zoom<=5][ScaleRank<=6] {
    line-join: round;
    line-color: @river-color;
    line-width: 4;
    polygon-fill: @water-color;
  }

  [zoom>5][ScaleRank<10]{
    line-join: round;
    line-color: @river-color;
    line-width: 5;
    polygon-fill: @water-color;    
  }
}

#rivers {
  [zoom>1][zoom<=4][SCALERANK<=3] {
    line-join: round;
    line-color: @river-color;
    line-width: 1;
  }
  [zoom>4][zoom<=5][SCALERANK<=6] {
    line-join: round;
    line-color: @river-color;
    line-width: 1.5;
  }
  [zoom>5][zoom<=8][SCALERANK<8]{
    line-join: round;
    line-color: @river-color;
    line-width: 1.75;
  }
  [zoom>8][SCALERANK<11]{
    line-join: round;
    line-color: @river-color;
    line-width: 2;
  }
}
*/
