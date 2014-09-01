steps = 256
slice = Math.PI / steps

canvasSize = 500
sphereSize = 420
padding = (canvasSize - sphereSize) / 2

strokeSize = [0]
strokeSteps = (1 / (steps / 2))

for i to steps
  if i isnt 0 then
    if i <= steps / 2
      strokeSize[i] = strokeSize[(i - 1)] + strokeSteps
    else if i > steps / 2
      strokeSize[i] = strokeSize[(i - 1)] - strokeSteps

#console.log strokeSize

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasSize, canvasSize
  colorMode HSB, 256
  bezierDetail 128
  noFill!

# --------------------------------------------------------------------------

draw = !->
  clear!
  background 0 0 250

  for i to steps

    sin1 = ((sin i * slice - HALF_PI) + 1) * 0.5
    sin2 = 128 + (128 * (sin (i + frameCount) * 0.01))

    range1 = lerp (sphereSize / TWO_PI) * -1, (sphereSize / TWO_PI), sin1
    range2 = lerp 0, sphereSize, sin1
    range3 = lerp 0, 2, strokeSize[i]
    range4 = lerp 0, 256, strokeSize[i]

    strokeWeight range3
    stroke sin2, 256, 256, range4

    bezier (sphereSize / 2) + padding, 0 + padding,
           range1 + range2 + padding, 0 + padding,
           range1 + range2 + padding, sphereSize + padding,
           (sphereSize / 2) + padding, sphereSize + padding

    bezier 0 + padding, (sphereSize / 2) + padding,
           0 + padding, range1 + range2 + padding,
           sphereSize + padding, range1 + range2 + padding,
           sphereSize + padding, (sphereSize / 2) + padding

mousePressed = !-> noLoop!
