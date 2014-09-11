canvasWidth     = 320
canvasHeight    = 200

centerPoint     = 1

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
colorInc        = 4.75
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
  background 0
  loadPixels!

  inc = canvasWidth / 100
  color = 0

  for i til width
    #incrementColor!
    #

    temp = (centerPoint * 0.03) + (i * 0.01)

    centerX = (canvasWidth * 0.5) + floor(80 * cos temp )
    centerY = (canvasHeight * 0.5) + floor(80 * sin temp )

    #console.log centerX, centerY

    # Tunner
    #centerX = (canvasWidth * 0.5) + floor((80 * (i / 100)) * cos centerPoint * 0.03)
    #centerY = (canvasHeight * 0.5) + floor((80 * (i / 100)) * sin centerPoint * 0.03)

    #mult = (320 - i) / 4


    #centerX = (canvasWidth * 0.5) + floor(mult * cos centerPoint * 0.04)
    #centerY = (canvasHeight * 0.5) + floor(mult * sin centerPoint * 0.04)

    #drawCircle centerX, centerY, i, [color, color, color]
    drawCircle centerX, centerY, i, [i, i, i]

    #stroke i
    #point centerX, centerY

    #color += inc


  #console.log \-----

  centerPoint++
  updatePixels!

# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
