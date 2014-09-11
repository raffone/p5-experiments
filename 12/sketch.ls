canvasWidth     = 320
canvasHeight    = 200

centerPoint     = 0
vortexMult      = 0

# --------------------------------------------------------------------------

drawCircle = (x0, y0, radius, color, opacity) !->

  x = radius
  y = 0
  radiusError = 1 - x

  while x >= y
    drawPixel  x + x0 ,  y + y0 , color , opacity
    drawPixel  y + x0 ,  x + y0 , color , opacity
    drawPixel -x + x0 ,  y + y0 , color , opacity
    drawPixel -y + x0 ,  x + y0 , color , opacity
    drawPixel -x + x0 , -y + y0 , color , opacity
    drawPixel -y + x0 , -x + y0 , color , opacity
    drawPixel  x + x0 , -y + y0 , color , opacity
    drawPixel  y + x0 , -x + y0 , color , opacity
    y++

    if radiusError < 0
      radiusError += 2 * y + 1;
    else
      x--
      radiusError += 2 * (y - x + 1)

drawPixel = (x, y, color, opacity) !->
  if x >= 0 and
     y >= 0 and
     x <= canvasWidth and
     y <= canvasHeight

    x = x * 4
    y = (y * canvasWidth) * 4

    opacity = 255 - opacity

    pixels[x + y]     = color[0] - opacity
    pixels[x + y + 1] = color[1] - opacity
    pixels[x + y + 2] = color[2] - opacity

# --------------------------------------------------------------------------
/*
*/
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

  inc = 255 / canvasWidth

  opacities = []

  for i til canvasWidth
    incrementColor!
    #

    vort = 0.10 + (0.06 * sin vortexMult * 0.005)
    mult = (i * vort)

    #vort = 0.10
    #mult = (centerPoint * 0.07) + (i * vort)

    centerX = (canvasWidth * 0.5) + floor(80 * cos mult )
    centerY = (canvasHeight * 0.5) + floor(80 * sin mult )


    opacity = max 0, ( i * inc  ) - ( max 0, floor (width / 2) - i)

    #color = [opacity, 0, 85 - (opacity / 3)]
    #color = [opacity, 0, 0]

    opacities.push opacity

    #drawCircle centerX, centerY, i, color
    drawCircle centerX, centerY, i, colorRGB, opacity

  #centerPoint++
  vortexMult++

  updatePixels!

# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
