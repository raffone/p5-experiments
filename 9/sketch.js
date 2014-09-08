// Generated by LiveScript 1.2.0
var canvasSize, pixelSize, colorRange, shape, shapeSize, position, res$, i$, lresult$, j$, setup, draw, mousePressed, mouseDragged, keyPressed;
canvasSize = 256;
pixelSize = 8;
colorRange = 100;
shape = [[0, 0, 2, 2, 2, 0, 0], [0, 2, 1, 1, 1, 2, 0], [2, 1, 1, 2, 1, 1, 2], [2, 1, 2, 1, 2, 1, 2], [2, 1, 1, 2, 1, 1, 2], [0, 2, 1, 1, 1, 2, 0], [0, 0, 2, 2, 2, 0, 0]];
shapeSize = -((shape.length - 1) / 2) * pixelSize;
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
  colorMode(HSB, colorRange);
};
draw = function(){
  var i$, step$, to$, y, j$, step1$, to1$, x;
  stroke(0, 0, 20);
  for (i$ = 0, to$ = canvasSize, step$ = pixelSize; step$ < 0 ? i$ > to$ : i$ < to$; i$ += step$) {
    y = i$;
    for (j$ = 0, to1$ = canvasSize, step1$ = pixelSize; step1$ < 0 ? j$ > to1$ : j$ < to1$; j$ += step1$) {
      x = j$;
      fill(lerp(60, 100, position[x][y] / colorRange), colorRange, position[x][y]);
      rect(x, y, pixelSize, pixelSize);
      if (position[x][y] > 0) {
        position[x][y] -= 2;
      }
    }
  }
};
mousePressed = mouseDragged = function(){
  var baseX, baseY, getCoord, i$, to$, shapeX, j$, to1$, shapeY, posX, posY;
  if (mouseX >= 0 && mouseX <= canvasSize && mouseY >= 0 && mouseY <= canvasSize) {
    baseX = mouseX - mouseX % pixelSize;
    baseY = mouseY - mouseY % pixelSize;
    getCoord = function(base, mult){
      return base + (shapeSize + pixelSize * mult);
    };
    for (i$ = 0, to$ = shape.length; i$ < to$; ++i$) {
      shapeX = i$;
      for (j$ = 0, to1$ = shape.length; j$ < to1$; ++j$) {
        shapeY = j$;
        posX = getCoord(baseX, shapeX);
        posY = getCoord(baseY, shapeY);
        if (shape[shapeX][shapeY] === 2) {
          position[posX][posY] = 100;
        }
        if (shape[shapeX][shapeY] === 1) {
          position[posX][posY] = 0;
        }
      }
    }
  }
};
keyPressed = function(){
  noLoop();
};