colors = []
count = 0
gradient = []
pos = 1.7
px = 8
#dim = px * 64
dim = 500
margin = 80
zoom = 0
colorRange = 255
circleSize = 128

# --------------------------------------------------------------------------

setup = !->
  createCanvas dim, dim
  colorMode HSB, 255

  #noStroke!
  noFill!

# --------------------------------------------------------------------------

draw = !->
  clear!
  background 0, 0, 245

  steps = 32
  slice = PI / steps

  size = 420
  offset = 40

  for i to steps
    range = ((sin i * slice - HALF_PI) + 1) * 0.5

    sin1 = lerp (size / TWO_PI) * -1, (size / TWO_PI), range
    sin2 = lerp 0, size, range
    #range = lerp 1 5 mov

    color = ( 255 / steps) * i
    #stroke color, 255, 255, color
    #stroke color

    #console.log sin1

    bezier (size / 2) + offset, 0 + offset,
           sin1 + sin2 + offset, 0 + offset,
           sin1 + sin2 + offset, size + offset,
           (size / 2) + offset, size + offset


    #bezier (size / 2) + offset, 0 + offset,
           #range +  (size / TWO_PI) + offset, 0 + offset,
           #range +  (size / TWO_PI) + offset, size + offset,
           #(size / 2) + offset, size + offset



    #bezier size, size,
           #( size / 3 ) * range, size + 5,
           #( size / 3 ) * range, ( size * 2 ) - 5,
           #size, size * 2

    #bezier 110, 0,
           #( size / 2 ) * range, size ,
           #( size / 2 ) * range, ( size * 2 ) - 5,
           #110, size

  /*

  #console.log size / TWO_PI

  stroke 0
  ellipse (size / 2) + offset, (size / 2) + offset, size, size

  stroke 255, 0, 0

  # LEFT
  bezier (size / 2) + offset, 0 + offset,
         -28 + 0 + offset, 0 + offset,
         -28 + 0 + offset, size + offset,
         (size / 2) + offset, size + offset

  stroke 0, 255, 0

  # RIGHT
  bezier (size / 2) + offset, 0 + offset,
         28 + size + offset, 0 + offset,
         28 + size  + offset, size + offset,
         (size / 2) + offset, size + offset

  */
  /*
  # LEFT
  bezier (size / 2) + offset, 0 + offset,
         0 - (size / TWO_PI) + offset, 0 + offset,
         0 - (size / TWO_PI) + offset, size + offset,
         (size / 2) + offset, size + offset

  stroke 0, 255, 0

  # RIGHT
  bezier (size / 2) + offset, 0 + offset,
         size + (size / TWO_PI) + offset, 0 + offset,
         size + (size / TWO_PI) + offset, size + offset,
         (size / 2) + offset, size + offset
  */

  #stroke 0, 255, 0

  #bezier (size / 2), 0,
         #(size / 3) * 5, size + 5,
         #(size / 3) * 5, ( size * 2 ) - 5,
         #(size / 2), size

  #pos++

mousePressed = !-> noLoop!
