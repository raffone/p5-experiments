count = 3
state = true

drawPixel = (val, i) !->
  pixels[i] = val
  pixels[i + 1] = val
  pixels[i + 2] = val


# --------------------------------------------------------------------------

setup = !->
  createCanvas 320, 200

# --------------------------------------------------------------------------

draw = !->
  background 255

  loadPixels!
  mult = floor count

  for i til (width * height) * 4 by 4
    drawPixel 0 i if i % mult is 0

  updatePixels!


