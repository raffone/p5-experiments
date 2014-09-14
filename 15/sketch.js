// Generated by LiveScript 1.2.0
var canvasWidth, canvasHeight, canvasMargin, halfWidth, halfHeight, maxHeight, minHeight, maxWidth, minWidth, stepsN, stepsWidth, colorRange, colorInc, count, setPixel, setup, draw, keyPressed, mousePressed;
canvasWidth = 400;
canvasHeight = 200;
canvasMargin = 50;
halfWidth = canvasWidth * 0.5;
halfHeight = canvasHeight * 0.5;
maxHeight = 80;
minHeight = 40;
maxWidth = 0.03;
minWidth = 0.022;
stepsN = maxHeight - minHeight;
stepsWidth = (maxWidth - minWidth) / stepsN;
colorRange = 255;
colorInc = colorRange / stepsN;
count = 0;
setPixel = function(x, y, color){
  if (x >= 0 && y >= 0 && x <= canvasWidth && y <= canvasHeight) {
    x = floor(x) * 4;
    y = (floor(y) * canvasWidth) * 4;
    pixels[x + y] = color;
    pixels[x + y + 1] = color;
    pixels[x + y + 2] = color;
  }
};
setup = function(){
  createCanvas(canvasWidth, canvasHeight);
};
draw = function(){
  var currWidthInc, i0, i1, i$, to$, i, tempWidth, color, j$, to1$, x, yOffset, y, k$, k;
  background(0);
  currWidthInc = minWidth;
  loadPixels();
  i0 = 0;
  i1 = stepsN;
  for (i$ = minHeight, to$ = maxHeight; i$ <= to$; ++i$) {
    i = i$;
    tempWidth = count;
    currWidthInc += stepsWidth;
    color = colorInc * i0;
    for (j$ = 0, to1$ = canvasWidth; j$ <= to1$; ++j$) {
      x = j$;
      yOffset = (maxHeight - i) * 0.5;
      y = (canvasMargin + yOffset) + (i * 0.5 + (i * 0.5) * sin(tempWidth));
      tempWidth += currWidthInc;
      for (k$ = 0; k$ <= 20; ++k$) {
        k = k$;
        setPixel(x, y + k, color - floor(k * 8));
      }
    }
    i0++;
  }
  count += 0.04;
  updatePixels();
};
keyPressed = mousePressed = function(){
  return noLoop();
};