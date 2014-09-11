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

    pixels[x + y]     = color[0]
    pixels[x + y + 1] = color[1]
    pixels[x + y + 2] = color[2]
    #pixels[x + y + 3] = opacity
    #pixels[x + y + 3] = 255

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

  inc = 100 / canvasWidth

  for i til width
    incrementColor!
    #

    #vort = 0.12 + (0.08 * abs sin vortexMult * 0.02)
    vort = 0.12
    mult = (centerPoint * 0.03) + (i * vort)

    centerX = (canvasWidth * 0.5) + floor(80 * cos mult )
    centerY = (canvasHeight * 0.5) + floor(80 * sin mult )

    #console.log centerX, centerY

    # Tunner
    #centerX = (canvasWidth * 0.5) + floor((80 * (i / 100)) * cos centerPoint * 0.03)
    #centerY = (canvasHeight * 0.5) + floor((80 * (i / 100)) * sin centerPoint * 0.03)

    #mult = (320 - i) / 4


    #centerX = (canvasWidth * 0.5) + floor(mult * cos centerPoint * 0.04)
    #centerY = (canvasHeight * 0.5) + floor(mult * sin centerPoint * 0.04)

    #drawCircle centerX, centerY, i, [color, color, color]
    opacity = ( i * inc )
    color = [opacity, opacity, opacity]
    #drawCircle centerX, centerY, i, colorRGB, opacity
    #

    #drawCircle centerX, centerY, i, [color, color, color]
    #
    #
    #
    #
    drawCircle centerX, centerY, i, color

    #console.log color

    #stroke i
    #point centerX, centerY

    #color += inc


  #console.log \-----

  centerPoint++
  vortexMult++

  updatePixels!

# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
