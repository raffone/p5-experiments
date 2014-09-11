canvasWidth     = 320
canvasHeight    = 199

centerPoint     = 0

# --------------------------------------------------------------------------

drawCircle = (x0, y0, radius, color) !->

  x = radius
  y = 0
  radiusError = 1 - x

  while x >= y
    drawPixel  x + x0 ,  y + y0 , color
    drawPixel  y + x0 ,  x + y0 , color
    drawPixel -x + x0 ,  y + y0 , color
    drawPixel -y + x0 ,  x + y0 , color
    drawPixel -x + x0 , -y + y0 , color
    drawPixel -y + x0 , -x + y0 , color
    drawPixel  x + x0 , -y + y0 , color
    drawPixel  y + x0 , -x + y0 , color
    y++

    if radiusError < 0
      radiusError += 2 * y + 1;
    else
      x--
      radiusError += 2 * (y - x + 1)

drawPixel = (x, y, color) !->
  if x >= 0 and
     y >= 0 and
     x <= canvasWidth and
     y <= canvasHeight

    x = x * 4
    y = (y * canvasWidth) * 4

    pixels[x + y]     = color[0]
    pixels[x + y + 1] = color[1]
    pixels[x + y + 2] = color[2]

# --------------------------------------------------------------------------

colorRange      = 255
colorRGB        = [colorRange, 0, 0]
#colorInc        = 4.77
colorInc        = 9.5
colorStepCurr   = 0
colorStepCount  = 0
colorSteps      =
  [
    [0         , colorInc  , 0]
    [-colorInc , 0         , 0]
    [0         , 0         , colorInc]
    [0         , -colorInc , 0]
    [colorInc  , 0         , 0]
    [0         , 0         , -colorInc]
  ]


incrementColor = !->
  for i til colorRGB.length
   colorRGB[i] = colorRGB[i] + colorSteps[colorStepCurr][i]

  colorStepCount += colorInc

  if colorStepCount >= 256
    colorStepCount := 0
    colorStepCurr  += 1

  if colorStepCurr is colorSteps.length
    colorStepCurr := 0


# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight

# --------------------------------------------------------------------------

draw = !->
  background 255
  loadPixels!

  centerX = (canvasWidth * 0.5) + floor(80 * cos centerPoint * 0.03)
  centerY = (canvasHeight * 0.5) + floor(80 * sin centerPoint * 0.03)

  for i to width
    incrementColor!
    drawCircle centerX, centerY, i, colorRGB

  centerPoint++
  updatePixels!

# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
