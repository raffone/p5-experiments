
let w = 64
let h = 64
let p = 10

let chars = ['$', '@', 'B', '%', '8', '&', 'W', 'M', '#', '*', 'o', 'a', 'h', 'k', 'b', 'd', 'p', 'q', 'w', 'm', 'Z', 'O', '0', 'Q', 'L', 'C', 'J', 'U', 'Y', 'X', 'z', 'c', 'v', 'u', 'n', 'x', 'r', 'j', 'f', 't', '/', "\\", '|', '(', ')', '1', '{', '}', '[', ']', '?', '-', '_', '+', '~', '<', '>', 'i', '!', 'l', 'I', ';', ':', ',', '"', '^', '`', "'"].reverse()
// let chars = [
//   "@",
//   "%",
//   "#",
//   "*",
//   "+",
//   "=",
//   "-",
//   ":",
//   ".",
//   "",
// ].reverse()

let r = chars.length
let rh = r / 2

function setup() {
  createCanvas(p * w, p * h);
  colorMode(HSB, r);
  textAlign(CENTER, CENTER);
  textFont('monospace', p);
  textStyle(NORMAL);
}

function draw() {
  background(0);

  let f = frameCount / 4
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
      let zoom = 1
      let color = (
        (rh + (rh * Math.sin((x + f) / (4 * zoom))))
        // + (rh + (rh * Math.sin((x) / 10)))
        + (rh + (rh * Math.sin((y + f) / (2 * zoom))))
        // + (rh + (rh * Math.sin((y) / 8)))
        + (rh + (rh * Math.sin((x + y + f) / (4 * zoom))))
        + (rh + (rh * Math.sin(Math.sqrt((x * x) + (y * y)) / (2 * zoom))))
      ) / 4

      // Debug
      // if (y==0) {
      //   console.log(x, y, color);
      // }

      noStroke();

      // Fill BW
      // fill(255);

      // Fill BW
      fill(color);

      // Fill HUE
      // fill(color, r, r);

      // Fill HUE cycling
      fill(((color + f) % r), r, r);

      // Pixel
      // square(x * p, y * p, p);

      // Text
      // console.log(color);
      text(chars[Math.floor(color)], x * p, y * p);

    }
  }
}
