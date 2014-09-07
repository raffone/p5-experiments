// Generated by LiveScript 1.2.0
var canvasSize, pixelSize, colorRange, position, res$, i$, lresult$, j$, setup, draw, mousePressed, mouseDragged, keyPressed;
canvasSize = 256;
pixelSize = 8;
colorRange = 100;
res$ = [];
for (i$ = 0; i$ <= canvasSize; ++i$) {
  lresult$ = [];
  for (j$ = 0; j$ <= canvasSize; ++j$) {
    lresult$.push(0);
  }
  res$.push(lresult$);
}
position = res$;
setup = function(){
  createCanvas(canvasSize, canvasSize);
  noStroke();
  colorMode(HSB, colorRange);
};
draw = function(){
  var i$, step$, to$, y, j$, step1$, to1$, x;
  stroke(0, 0, 20);
  for (i$ = 0, to$ = canvasSize, step$ = pixelSize; step$ < 0 ? i$ > to$ : i$ < to$; i$ += step$) {
    y = i$;
    for (j$ = 0, to1$ = canvasSize, step1$ = pixelSize; step1$ < 0 ? j$ > to1$ : j$ < to1$; j$ += step1$) {
      x = j$;
      fill(50, 100, constrain(position[x][y], 0, colorRange));
      rect(x, y, pixelSize, pixelSize);
    }
  }
};
mousePressed = mouseDragged = function(){
  var baseX, baseY, i$, to$, x, j$, to1$, y;
  if (mouseX >= 0 && mouseX <= canvasSize && mouseY >= 0 && mouseY <= canvasSize) {
    baseX = mouseX - mouseX % pixelSize;
    baseY = mouseY - mouseY % pixelSize;
    for (i$ = 0, to$ = pixelSize; i$ <= to$; ++i$) {
      x = i$;
      for (j$ = 0, to1$ = pixelSize; j$ <= to1$; ++j$) {
        y = j$;
        position[baseX - pixelSize + x][baseY - pixelSize + y] += 20;
      }
    }
  }
};
keyPressed = function(){
  noLoop();
};