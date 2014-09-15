canvasWidth  = 400
canvasHeight = 200
canvasMargin = 40

halfWidth    = canvasWidth * 0.5
halfHeight   = canvasHeight * 0.5

maxHeight    = 100
minHeight    = 20

maxWidth     = 0.06
#minWidth     = 0.022
minWidth     = 0.09

stepsN       = (maxHeight - minHeight)
stepsWidth   = (maxWidth - minWidth) / stepsN

colorRange   = 255
colorInc     = colorRange / stepsN

count        = 0

# --------------------------------------------------------------------------

setPixel = (x, y, color) !->
  if x >= 0 and
     y >= 0 and
     x <= canvasWidth and
     y <= canvasHeight

    x = floor(x) * 4
    y = (floor(y) * canvasWidth) * 4

    pixels[x + y]     = color
    pixels[x + y + 1] = color
    pixels[x + y + 2] = color


# --------------------------------------------------------------------------


setup = !->
  createCanvas canvasWidth, canvasHeight



# --------------------------------------------------------------------------

draw = !->

  background 0

  currWidthInc  = minWidth

  loadPixels!

  i0 = 0

  for i from minHeight to maxHeight
    tempWidth = count
    currWidthInc += stepsWidth
    color = colorInc * i0

    for x to canvasWidth

      yOffset = ( maxHeight - i ) * 0.5
      y = (canvasMargin + yOffset) + ((i * 0.5) + (i * 0.5) * sin tempWidth)

      tempWidth += currWidthInc

      for k to 20
        setPixel x, y + k, color - floor k * 8

    i0++

  count += 0.08


  updatePixels!


# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
