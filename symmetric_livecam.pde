import processing.video.*;import processing.video.*;
Capture video;

final int SCREEN_WIDTH = 1280;
final int SCREEN_HEIGHT = 720;

final int CAPTURE_WIDTH = 1280;
final int CAPTURE_HEIGHT = 720;

void setup() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  background(0);
  
  video = new Capture(this, CAPTURE_WIDTH, CAPTURE_HEIGHT);
  video.start();

}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  video.loadPixels();
  for(int y = 0; y < video.height / 2; y++) {
     for(int x = 0; x < video.width / 2; x++) {
        set(x,y,video.get(x,y));
        set(video.width - 1 - x,y,video.get(x,y));
        set(video.width - 1 - x,video.height - 1 - y,video.get(x,y));
        set(x,video.height - 1 - y,video.get(x,y));
    } 
  }
}
