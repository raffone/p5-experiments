
let w = 32 * 2
let h = 32
let p = 20


let cr = 255 // color range
let rr = 80 // rotation range


let r = 1
let rh = r / 2

function setup() {
  createCanvas(p * w, p * h);
  colorMode(HSB, cr);
  angleMode(DEGREES)
}

function draw() {
  background(0);
  let f = frameCount / 4
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {


      // Combined sine v2
      let zoom = 1
      let pixel = ((
        (rh + (rh * Math.sin((x + f) / (4 * zoom))))
        + (rh + (rh * Math.sin((y + f) / (2 * zoom))))
        + (rh + (rh * Math.sin((x + y + f) / (4 * zoom))))
        + (rh + (rh * Math.sin(Math.sqrt((x * x) + (y * y)) / (2 * zoom))))
      ) / 4)


      noStroke();

      // Fill BW
      fill(255);

      // Fill BW
      let color = cr * pixel

      // fill(color);

      // Fill HUE
      // fill(color, cr, cr);

      // Fill HUE cycling
      // fill(((color + f) % r), r, r);

      // Pixel
      // rotate(color - rh);    // console.log('rotate', color - rh);

      // if (pixel<.2) {
      //   pixel *= pixel
      // }


      square_width = p - 4
      square_height = 1 + ((p / 2) * pixel)

      offset_x = (square_width / 2)
      offset_y = (square_height / 2)

      // console.log('color', color);

      let angle = (rr * pixel) - (rr / 2)

      push();
      translate(x * p + offset_x, y * p + offset_y);
      rotate(angle);
      rect(0 - offset_x, 0 - offset_y, square_width, square_height);
      pop();



    }
  }
}
