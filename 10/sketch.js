// Generated by LiveScript 1.2.0
var count, state, drawPixel, setup, draw;
count = 3;
state = true;
drawPixel = function(val, i){
  pixels[i] = val;
  pixels[i + 1] = val;
  pixels[i + 2] = val;
};
setup = function(){
  createCanvas(320, 200);
};
draw = function(){
  var mult, i$, to$, i;
  background(255);
  loadPixels();
  mult = floor(count);
  for (i$ = 0, to$ = (width * height) * 4; i$ < to$; i$ += 4) {
    i = i$;
    if (i % mult === 0) {
      drawPixel(0, i);
    }
  }
  updatePixels();
};
$(function(){
  return $('.modulo').on('change', function(){
    count = $(this).val();
    return $('.modulo').val(count);
  });
});