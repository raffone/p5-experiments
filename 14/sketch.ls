canvasWidth   = 500
canvasHeight  = 500
canvasMargin  = 50
#canvasMargin = 0

halfWidth     = canvasWidth * 0.5
halfHeight    = canvasHeight * 0.5

circleDiag    = canvasWidth - (canvasMargin * 2)
circleRad     = circleDiag * 0.5

colorRange    = 255

#debug         = true
debug         = false

molt         = 2


count1         = 0
count2         = Math.PI

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight

# --------------------------------------------------------------------------

draw = !->

  clear!

  molt1 = 0.4 + ( 0.4 + (0.2 * cos count1))
  #molt1 = ( 0.5 + (0.5 * sin count1 * 0.02))
  #molt1 = 0.6
  ##molt2 = 15 + (15 * cos count1 * 0.02)
  molt2 = 2 + (18 + (18 * cos count2))
  #molt2 = 37
  #molt1 = 0.8

  #console.log (cos count1), (cos count2)
  console.log molt1, molt2

  # 0.4 = 64
    # 0.6 = 37
  # 0.8 = 21
    # 1.0 = 1
  #



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
  steps = 88
  quaterSteps = steps * 0.25

  inc = PI / (steps * 0.5)
  points = []

  for i til steps

    x = circleRad + (circleRad * sin inc * i) + canvasMargin
    y = circleRad + (circleRad * molt1 * cos inc * i) + canvasMargin

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
  incColor = 255 / (steps * 0.5)

  for i from 1 til pairs.length - 1

    ellipseWidth = pairs[i].left.x - pairs[i].right.x
    ellipseHeight = (pairs[i - 1].left.y - pairs[i + 1].left.y) * 0.5
    #ellipseHeightOffset = 0

    #------------------------------------------------------------

    #stroke 0 0 0 20
    #fill i * incColor

    noFill!
    stroke incColor * i

    ellipse halfWidth,
            pairs[i].left.y,
            ellipseWidth,
            ellipseHeight * molt2

    #------------------------------------------------------------
    if debug
      fill 0 0 0 0
      stroke 0 150 255
      ellipse halfWidth, pairs[i].left.y, 2,2

  if debug
    fill 0 0 0 0
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


  count1 += PI / 90
  count2 += PI / 90







# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
