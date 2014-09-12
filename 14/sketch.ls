canvasWidth   = 500
canvasHeight  = 500
canvasMargin  = 50
#canvasMargin = 0

halfWidth     = canvasWidth * 0.5
halfHeight    = canvasHeight * 0.5

circleDiag    = canvasWidth - (canvasMargin * 2)
circleRad     = circleDiag * 0.5

colorRange    = 255

debug         = true

molt         = 2

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight

# --------------------------------------------------------------------------

#draw = !->

  clear!


  background 0
  fill 0

  # circle outline
  /*
  stroke 255
  ellipse halfWidth,
          halfHeight,
          circleR * 2,
          circleR * 2
  */



  # Calc points
  steps = 44
  quaterSteps = steps * 0.25

  inc = PI / (steps / 2)
  points = []

  for i til steps

    x = circleRad + (circleRad * sin inc * i) + canvasMargin
    y = circleRad + (circleRad * 0.5 * cos inc * i) + canvasMargin

    if debug
      fill 255
      ellipse x, y, 4, 4

    points.push do
      x: x
      y: y

  if debug
    for i from 1 til points.length
      stroke 0 80 80
      line points[i].x, points[i].y, points[i - 1].x, points[i - 1].y

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
  noFill!

  console.log points[points.length / 2] # Middle top point
  console.log points[0]                 # Middle bot point
  console.log points[0].y - points[points.length / 2].y

  for i from 1 til pairs.length - 1

    ellipseWidth = pairs[i].left.x - pairs[i].right.x

    ellipseHeight = (pairs[i - 1].left.y - pairs[i + 1].left.y) * 0.5

    ellipseHeightOffset = 0

    #------------------------------------------------------------

    stroke 255 0 0

    ellipse halfWidth,
            pairs[i].left.y,
            ellipseWidth,
            #ellipseHeight * 54
            ellipseHeight * 24
            #ellipseHeight * 39
            #ellipseHeight
            #
            #


    console.log ellipseHeight, ellipseHeight * 24, round ellipseHeight + (ellipseHeight * 24)
    # 2  |  24
    # 3  |  39

    # 0.05  |  280
    # 0.25  |  54
    # 0.50  |  24
    # 0.85  |  8

    #
    # 1.00  |  1    + 5
    # 0.90  |  6    + 4
    # 0.80  |  10   + 4
    # 0.70  |  14   + 4
    # 0.60  |  18   + 6
    # 0.50  |  24   + 8
    # 0.40  |  32

    #------------------------------------------------------------
    if debug
      stroke 0 150 255
      ellipse halfWidth, pairs[i].left.y, 2,2

  if debug
    stroke 0 255 0
    ellipse halfWidth, halfHeight, circleDiag, circleDiag


  /*

    #------------------------------------------------------------

    if debug
      stroke 255

      line pairs[i].left.y + canvasMargin, pairs[i].left.x + canvasMargin,
           pairs[i].right.y + canvasMargin, pairs[i].right.x + canvasMargin

      line pairs[i].left.x + canvasMargin, pairs[i].left.y + canvasMargin,
           pairs[i].right.x + canvasMargin, pairs[i].right.y + canvasMargin
  */

  #console.log pairs
  #console.log pairs.length









# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
