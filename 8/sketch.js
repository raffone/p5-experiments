// Generated by LiveScript 1.2.0
var canvasSize, pixelArrayLenght, value, position, res$, i$, lresult$, j$, lresult1$, k$, setup, draw, mouseMoved;
canvasSize = 100;
pixelArrayLenght = Math.pow(8, 2) * 4;
value = 0;
res$ = [];
for (i$ = 0; i$ <= canvasSize; ++i$) {
  lresult$ = [];
  for (j$ = 0; j$ <= canvasSize; ++j$) {
    lresult1$ = [];
    for (k$ = 0; k$ <= 4; ++k$) {
      lresult1$.push(255);
    }
    lresult$.push(lresult1$);
  }
  res$.push(lresult$);
}
position = res$;
setup = function(){
  createCanvas(canvasSize, canvasSize);
  noFill();
  loadPixels();
};
draw = function(){
  var count, i$, to$, y, j$, to1$, x;
  count = 0;
  for (i$ = 0, to$ = canvasSize; i$ < to$; ++i$) {
    y = i$;
    for (j$ = 0, to1$ = canvasSize; j$ < to1$; ++j$) {
      x = j$;
      pixels[count] = position[x][y][0];
      pixels[count + 1] = position[x][y][1];
      pixels[count + 2] = position[x][y][2];
      pixels[count + 3] = position[x][y][3];
      count += 4;
    }
  }
  updatePixels();
};
mouseMoved = function(){
  if (mouseX >= 0 && mouseX <= canvasSize && mouseY >= 0 && mouseY <= canvasSize) {
    position[mouseX][mouseY] = [0, 0, 0, 255];
    console.log(mouseX, mouseY);
  }
};