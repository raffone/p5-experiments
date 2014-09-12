canvasWidth     = 400
canvasHeight    = 400

halfWidth     = canvasWidth * 0.5
halfHeight    = canvasHeight * 0.5

#stepMax    = 0.4
#stepMin    = 0.05
#stepInc    = 0.025
#stepOffset = 20

colorRange = 255
#colorInc   = colorRange / ( (stepMax - stepMin) / stepInc)

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight

  background 0
  fill 0

  /*
  stroke 100
  ellipse halfWidth, halfHeight, height, height

  stroke 255
  ellipse halfWidth, halfHeight, 2, 2
*/



  # Calc points
  steps = 44
  inc = PI / (steps / 2)
  points = []

  for i til steps
    stroke 255, 0, 0
    fill 255, 0, 0

    x = halfHeight + (halfHeight * sin (inc * i))
    y = halfHeight + (halfHeight * cos (inc * i))

    ellipse x, y, 4, 4

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
  for pair in pairs

    stroke 125

    line pair.left.x, pair.left.y,
         pair.right.x, pair.right.y

    line pair.left.y, pair.left.x,
         pair.right.y, pair.right.x

    # --

    stroke 0 255 0

    line pair.left.x, pair.left.y,
         pair.right.y, pair.right.x

    line pair.left.y, pair.left.x,
         pair.right.x, pair.right.y



  #console.log pairs

# --------------------------------------------------------------------------

#draw = !->









# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
