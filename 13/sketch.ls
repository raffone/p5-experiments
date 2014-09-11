canvasWidth     = 320
canvasHeight    = 200

count = 0
count2 = 0
count3 = 0
#line2 = 0

#centerPoint     = 0
#vortexMult      = 0

# --------------------------------------------------------------------------

/*
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
*/

/*
drawPixel = (x, y, color, opacity) !->
  if x >= 0 and
     y >= 0 and
     x <= canvasWidth and
     y <= canvasHeight

    x = x * 4
    y = (y * canvasWidth) * 4

    opacity = colorRange - opacity

    pixels[x + y]     = color[0] - opacity
    pixels[x + y + 1] = color[1] - opacity
    pixels[x + y + 2] = color[2] - opacity
*/

# --------------------------------------------------------------------------


/*
colorRGB        = [colorRange, 0, 0]
colorInc        = 4.90
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
*/

stepMax    = 0.4
stepMin    = 0.05
stepInc    = 0.025
stepOffset = 20

colorRange = 255
colorInc   = colorRange / ( (stepMax - stepMin) / stepInc)

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight

# --------------------------------------------------------------------------

sinPixel = (x, y0,  color) !->
  yHeightMult = 0 + (y0 * sin (count * 0.04))
  yPosition = sin (x + count) * 0.04

  y = (height * 0.5) + (height * yHeightMult) * yPosition

  xOffsetMult = 0.04 #+ (0.01 * sin (count3++ * 0.000000004))
  yOffsetMult = 0.02 #+ (0.01 * sin (count3++ * 0.000000004))

  xOffset = 20 + (20 * sin (count2++ * xOffsetMult))
  yOffset = 20 + (20 * cos (count2++ * yOffsetMult))

  stroke color
  point x + xOffset, y + yOffset - stepOffset


draw = !->
  background 0
  #loadPixels!

  for x from -40 til canvasWidth

    color = 0

    for i from stepMin to stepMax by stepInc
      sinPixel x, i, color
      color += colorInc

      #drawPixel line1X, line1Y, [255,255,255], 255



  count++

  #updatePixels!

# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
