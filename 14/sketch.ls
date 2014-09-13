canvasWidth   = 400
canvasHeight  = 400
canvasMargin  = 50

halfWidth     = canvasWidth * 0.5
halfHeight    = canvasHeight * 0.5

circleDiag    = canvasWidth - (canvasMargin * 2)
circleRad     = circleDiag * 0.5

colorRange    = 255

#debug         = true
#debug         = false

count1         = 0
count2         = Math.PI

# --------------------------------------------------------------------------

drawCircle = (x0, y0, x1, y1) !->

  # values of diameter
  a = abs x1 - x0
  b = abs y1 - y0
  b1 = b .&. 1

  # error increment
  dx = 4 * (1 - a) * b * b
  dy = 4 * (b1 + 1) * a * a

  # error of 1.step
  err = dx + dy + b1 * a * a
  e2  = 0

  # if called with swapped points
  if x0 > x1
    x0 = x1
    x1 += a

  # .. exchange them
  if y0 > y1
    y0 = y1

  # starting pixel
  y0 += (b + 1) / 2
  y1 = y0 - b1

  a *= 8 * a
  b1 = 8 * b * b

  do
      setPixel x1, y0  #   I. Quadrant
      setPixel x0, y0  #  II. Quadrant
      setPixel x0, y1  # III. Quadrant
      setPixel x1, y1  #  IV. Quadrant
      e2 = 2 * err

      # y step
      if e2 <= dy
        y0++
        y1--
        err += dy += a

      # x step
      if e2 >= dx or 2 * err > dy
        x0++
        x1--
        err += dx += b1

  while x0 <= x1

  # too early stop of flat ellipses a=1
  while y0 - y1 < b

    # -> finish tip of ellipse
    setPixel x0 - 1, y0
    setPixel x1 + 1, y0++
    setPixel x0 - 1, y1
    setPixel x1 + 1, y1--


setPixel = (x, y, color, opacity) !->
  if x >= 0 and
     y >= 0 and
     x <= canvasWidth and
     y <= canvasHeight

    x = floor(x) * 4
    y = (floor(y) * canvasWidth) * 4

    #opacity = colorRange - opacity
    opacity = 0
    color = [255,255,255]

    pixels[x + y]     = color[0] - opacity
    pixels[x + y + 1] = color[1] - opacity
    pixels[x + y + 2] = color[2] - opacity


# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight

# --------------------------------------------------------------------------

draw = !->


  #clear!

  molt1 = 0.4 + ( 0.4 + (0.2 * cos count1))
  molt2 = 2 + (18 + (18 * cos count2))


  # 0.4 = 64
    # 0.6 = 37
  # 0.8 = 21
    # 1.0 = 1
  #


  background 0

  loadPixels!

  #fill 0

  # circle outline

  #stroke 255
  #ellipse halfWidth,
          #halfHeight,
          #circleR * 2,
          #circleR * 2




  # Calc points
  steps = 88
  quaterSteps = steps * 0.25

  inc = PI / (steps * 0.5)
  points = []

  for i til steps

    x = circleRad + (circleRad * sin inc * i) + canvasMargin
    y = circleRad + (circleRad * molt1 * cos inc * i) + canvasMargin

    #if debug
      #fill 255
      #ellipse x, y, 4, 4

    points.push do
      x: x
      y: y

  #if debug
    #for i from 1 til points.length
      #stroke 0 80 80
      #line points[i].x, points[i].y, points[i - 1].x, points[i - 1].y

  # Make pairs
  pairs = []

  for i to points.length * 0.5

    if i is 0 or i is points.length * 0.5
      right = points[i]
      left = points[i]
    else
      right = points[i]
      left = points[points.length  - i]


    pairs.push do
      right: right
      left: left


  # Draw lines
  incColor = 255 / (steps * 0.5)

  for i from 1 til pairs.length - 1

    ellipseWidth = pairs[i].left.x - pairs[i].right.x

    ellipseHeight = (((pairs[i - 1].left.y - pairs[i + 1].left.y) * 0.5) * molt2) * 0.5
    #ellipseHeight *= molt2
    #ellipseHeight *= 0.5

    #ellipseHeightOffset = 0

    #------------------------------------------------------------

    #stroke 0 0 0 20
    #fill i * incColor

    #noFill!
    #stroke incColor * i
    color = [incColor * i for til 3]


    #ellipse halfWidth,
            #pairs[i].left.y,
            #ellipseWidth,
            #ellipseHeight * molt2


    #console.log color

    drawCircle pairs[i].left.x,
               pairs[i].left.y - ellipseHeight,
               pairs[i].right.x,
               pairs[i].right.y + ellipseHeight,

    #------------------------------------------------------------
    #if debug
      #fill 0 0 0 0
      #stroke 0 150 255
      #ellipse halfWidth, pairs[i].left.y, 2,2

  #if debug
    #fill 0 0 0 0
    #stroke 0 255 0
    #ellipse halfWidth, halfHeight, circleDiag, circleDiag

    #------------------------------------------------------------

    #if debug
      #stroke 255

      #line pairs[i].left.y + canvasMargin, pairs[i].left.x + canvasMargin,
           #pairs[i].right.y + canvasMargin, pairs[i].right.x + canvasMargin

      #line pairs[i].left.x + canvasMargin, pairs[i].left.y + canvasMargin,
           #pairs[i].right.x + canvasMargin, pairs[i].right.y + canvasMargin

  count1 += PI / 180
  count2 += PI / 180

  updatePixels!






# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
