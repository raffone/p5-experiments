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

    x = circleRad + (circleRad * sin (inc * i)) + canvasMargin
    y = circleRad + (circleRad * cos (inc * i)) + canvasMargin

    if debug
      fill 255
      ellipse x, y, 4, 4

    points.push do
      x: x
      y: y

  #console.log points
  #console.log points.length

  if debug
    for i from 1 til points.length
      stroke 0 255 0
      line points[i].x, points[i].y, points[i - 1].x, points[i - 1].y

  # Make pairs
  pairs = []


  #for i from 1 til points.length / 2
  for i to points.length * 0.5

    #console.log i

    if i is 0 or i is points.length * 0.5
      right = points[i]
      left = points[i]
    else
      right = points[i]
      left = points[points.length  - i]


    pairs.push do
      right: right
      left: left


  #console.log pairs
  #console.log pairs.length

  noFill!

  # Draw lines
  for i from 1 til pairs.length - 1

    #stroke 0 255 0


    #ellipseHeightMolt = 0.2 + (0.4 * sin frameCount * 0.01)
    #ellipseHeightMolt = 3.5
    #ellipseHeightMolt = 1

    #ellipseWidth = (circleR * 2) - (pairs[i].left.x * 2)
    #ellipseHeight = ( (circleR * 2) - (pairs[i].left.x * 2) ) * ellipseHeightMolt

    #ellipseHeight = ( pairs[i].left.y - pairs[i - 1].left.y)

    ellipseWidth = pairs[i].left.x - pairs[i].right.x

    ellipseHeight = (pairs[i - 1].left.y - pairs[i + 1].left.y) * 0.5



    #
    #
    #if i is 0
      #ellipseHeight = (abs pairs[i].left.y - pairs[i + 1].left.y)
    #else
      #ellipseHeight = (abs pairs[i].left.y - pairs[i - 1].left.y)


    #ellipseHeight *= ellipseHeightMolt
    #ellipseHeight += ellipseHeight * 6


    #ellipseHeightOffset = if i < pairs.length * 0.5 then (ellipseHeight * 0.5) else -(ellipseHeight * 0.5)
    ellipseHeightOffset = 0

    #------------------------------------------------------------

    stroke 255 0 0

    ellipse halfWidth,
            pairs[i].left.y,
            ellipseWidth,
            #ellipseHeight * 7
            ellipseHeight

    #------------------------------------------------------------
    if debug
      stroke 0 150 255
      ellipse halfWidth, pairs[i].left.y, 2,2

  if debug
    stroke 0 255 0
    #ellipse halfWidth, halfHeight, circleDiag, circleDiag


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
