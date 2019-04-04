
ArrayList<PVector> locations; // 位置情報を保存する配列

void setup(){
  
  //
  // 初期化
  //
  frameRate(30);
  size(512, 512);
  fill(0);
 
  //
  // 文字「5」を描写して、pixelsへ結果をロード
  // 文字「5」上の座標になるランダムな座標情報を100個記憶する
  //
  background(255);
  
  textAlign(CENTER, TOP);
  textSize(600);
  float ascent = textAscent();
  float descent = textDescent();
  float textHeight = ascent + descent;
  text("5", width / 2, (int)(height - textHeight) / 2);
  
  loadPixels();
  
  locations = new ArrayList<PVector>();
  while(locations.size() < 100){
   
    int x = (int)random(width);
    int y = (int)random(height);

    float pixel_value = red(pixels[x + y * width]);
    if(pixel_value != 255){
     
      PVector location = new PVector(x, y);
      locations.add(location);
    }   
  }
}

void draw(){
    
  //
  // 記憶した座標100個に小さい「5」を描写
  //
  
  randomSeed(39);
  
  background(239);
  fill(39);
  textAlign(CENTER, CENTER);
  
  for(int i = 0; i < locations.size(); i++){
    
    PVector location = locations.get(i);
    
    push();
    translate(location.x, location.y);
    rotate(frameCount * random(0.1, 0.3));
    
    float fontSize = noise(random(100) + frameCount * 0.05) * 100;
    
    fill(239);
    textSize(fontSize);
    text("5", 0, 0);
    
    fill(39);
    textSize(fontSize - 3);
    text("5", 0, 0);
    
    pop();
  }
}
