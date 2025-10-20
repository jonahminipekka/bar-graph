// Simple Bar Graph Example
// Includes title, labels, and axes

float[] data = {80, 50, 90, 40, 70};  // example data
String[] labels = {"A", "B", "C", "D", "E"};

void setup() {
  size(600, 400);
  drawBarGraph();
}

void drawBarGraph() {
  background(255);
  drawXAxis();
  drawYAxis();
  drawBars();
  drawTitle();
}

void drawBars() {
  fill(100, 150, 255);
  int numBars = data.length;
  float barWidth = width / (numBars + 2);
  
  for (int i = 0; i < numBars; i++) {
    float x = (i + 1) * barWidth;
    float y = height - data[i] - 50;
    rect(x, y, barWidth * 0.6, data[i]);
    
    // Draw labels
    fill(0);
    textAlign(CENTER);
    text(labels[i], x + barWidth * 0.3, height - 30);
    fill(100, 150, 255);
  }
}

void drawXAxis() {
  stroke(0);
  line(50, height - 50, width - 30, height - 50);
  
  fill(0);
  textAlign(CENTER);
  text("Categories", width / 2, height - 10);
}

void drawYAxis() {
  stroke(0);
  line(50, 50, 50, height - 50);
  
  fill(0);
  textAlign(CENTER);
  pushMatrix();
  translate(20, height / 2);
  rotate(-HALF_PI);
  text("Value", 0, 0);
  popMatrix();
}

void drawTitle() {
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Simple Bar Graph", width / 2, 30);
}
