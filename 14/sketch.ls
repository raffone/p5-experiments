canvasWidth  = 300
canvasHeight = 300
canvasMargin = 50

halfWidth    = canvasWidth * 0.5
halfHeight   = canvasHeight * 0.5

circleR      = 100

colorRange   = 255


# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight

# --------------------------------------------------------------------------

draw = !->

  clear!


  background 0
  fill 0

  # circle outline
  stroke 255 0 0
  ellipse halfWidth,
          halfHeight,
          circleR * 2,
          circleR * 2




  # Calc points
  steps = 44
  inc = PI / (steps / 2)
  points = []

  for i til steps
    stroke 255, 0, 0
    fill 255, 0, 0

    x = circleR + (circleR * sin (inc * i))
    y = circleR + (circleR * cos (inc * i))

    #ellipse x, y, 4, 4

    points.push do
      x: x
      y: y


  # Make pairs
  pairs = []

  for i from 1 til points.length / 2
    pairs.push do
      right: points[i]
      left: points[points.length - i]



  # Draw lines
  #for pair in pairs
  for i til pairs.length


    # straight
    /*
    stroke 125

    line pairs[i].left.x, pairs[i].left.y,
         pairs[i].right.x, pairs[i].right.y

    line pairs[i].left.y, pairs[i].left.x,
         pairs[i].right.y, pairs[i].right.x
    */


    stroke 0 255 0
    fill 0 0 0 0


    ellipseHeightMolt = 0.2 + (0.4 * sin frameCount * 0.01)

    ellipseWidth = (circleR * 2) - (pairs[i].left.x * 2)
    ellipseHeight = ( (circleR * 2) - (pairs[i].left.x * 2) ) * ellipseHeightMolt
    ellipseHeightOffset = ellipseHeight / 2

    ellipse circleR + canvasMargin,
            pairs[i].left.y + canvasMargin,
            ellipseWidth,
            ellipseHeight


    # diagonal
    /*
    stroke 0 255 0

    line pairs[i].left.x, pairs[i].left.y,
         pairs[i].right.y, pairs[i].right.x

    line pairs[i].left.y, pairs[i].left.x,
         pairs[i].right.x, pairs[i].right.y
    */


  #console.log pairs









# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
