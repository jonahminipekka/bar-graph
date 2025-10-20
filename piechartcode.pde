// Simple Pie Chart Example
// Includes labels and title

float[] data = {30, 60, 90, 45, 75};  // example data
String[] labels = {"A", "B", "C", "D", "E"};
color[] colors;

void setup() {
  size(600, 400);
  colors = new color[data.length];
  for (int i = 0; i < data.length; i++) {
    colors[i] = color(random(100,255), random(100,255), random(100,255));
  }
  drawPieChart();
}

void drawPieChart() {
  background(255);
  drawSlices();
  drawLabels();
  drawTitle();
}

void drawSlices() {
  float total = 0;
  for (float val : data) {
    total += val;
  }
  
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    fill(colors[i]);
    float angle = map(data[i], 0, total, 0, TWO_PI);
    arc(width/2, height/2, 250, 250, lastAngle, lastAngle + angle, PIE);
    lastAngle += angle;
  }
}

void drawLabels() {
  float total = 0;
  for (float val : data) {
    total += val;
  }
  
  float lastAngle = 0;
  textAlign(LEFT);
  textSize(14);
  for (int i = 0; i < data.length; i++) {
    fill(colors[i]);
    rect(width - 160, 80 + i*30, 20, 20);
    fill(0);
    text(labels[i] + " (" + nf((data[i]/total)*100, 0, 1) + "%)", width - 130, 95 + i*30);
  }
}

void drawTitle() {
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Simple Pie Chart", width/2, 30);
}
