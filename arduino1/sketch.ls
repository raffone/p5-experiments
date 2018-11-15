canvasWidth     = 320
canvasHeight    = 200

count = 0
# count2 = 0
# count3 = 0

# stepMax    = 0.4
# stepMin    = 0.05
# stepInc    = 0.025
# stepOffset = 20

# colorRange = 255
# colorInc   = colorRange / ( (stepMax - stepMin) / stepInc)

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight

# --------------------------------------------------------------------------

# sinPixel = (x, y0,  color) !->
#   yHeightMult = 0 + (y0 * sin (count * 0.04))
#   yPosition = sin (x + count) * 0.04

#   y = (height * 0.5) + (height * yHeightMult) * yPosition

#   xOffsetMult = 0.04 #+ (0.01 * sin (count3++ * 0.000000004))
#   yOffsetMult = 0.02 #+ (0.01 * sin (count3++ * 0.000000004))

#   xOffset = 20 + (20 * sin (count2++ * xOffsetMult))
#   yOffset = 20 + (20 * cos (count2++ * yOffsetMult))

#   stroke color
#   point x + xOffset, y + yOffset - stepOffset

y = 50
speed = 255

draw = !->
  background 0



  y = (((sin(count*(0.005 + (speed*0.1 / 255)))) * 128) + 128)



  console.log y

  ellipse 50, y, 10, 10 

  #loadPixels!

  # for x from -40 til canvasWidth

  #   color = 0

  #   for i from stepMin to stepMax by stepInc
  #     sinPixel x, i, color
  #     color += colorInc

  #     #drawPixel line1X, line1Y, [255,255,255], 255



  count++

  #updatePixels!

# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!