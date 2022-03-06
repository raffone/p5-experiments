
let w = 64
let h = 64
let p = 10


function setup() {
  createCanvas(p * w, p * h);
  background(220);

  colorMode(HSB, 255);


  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {


      // Fixed color
      // let color  = 127

      // Random color
      // let color  = Math.round(Math.random() * 255)

      // One side sine
      // let color = 127 + (127 * Math.sin(x / 2))

      // Sloped sine
      // let color = 127 + (127 * Math.sin((x + y) / 2))

      // Circle sine
      // let center = Math.sqrt((x - w / 2) * (x - w / 2) + (y - h / 2) * (y - h / 2))
      // let color = 127 + (127 * Math.sin(center / 2))

      // Combined sine
      // let color = (
      //   (127 + (127 * Math.sin((x) / 2))) +
      //   (127 + (127 * Math.sin((y) / 2)))
      // ) / 2

      // Combined sine v2
      let color = (
        (127 + (127 * Math.sin((x) / 2)))
        // + (127 + (127 * Math.sin((x) / 2)))
        + (127 + (127 * Math.cos((y) / 3)))
        + (127 + (127 * Math.sin((x + y) / 6)))
      ) / 3

      // Debug
      // if (y==0) {
      //   console.log(x, y, color);
      // }

      noStroke();

      // Fill BW
      // fill(color);

      // Fill HUE
      fill(color, 256, 256);

      square(x * p, y * p, p);

    }
  }

}

function draw() {
}
