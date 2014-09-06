steps = 32
slice = Math.PI / steps

canvasSize = 500
sphereSize = 420
paddingSize = (canvasSize - sphereSize) / 2

strokeSize = [0]
strokeSteps = (1 / (steps / 2))

linesPosition = [0 for i to steps]

#console.log linesPosition

animationCount = 0
animationSpeed = 0.025
#animationSteps = 1


for i from 1 to steps
  if i <= steps / 2
    strokeSize[i] = strokeSize[(i - 1)] + strokeSteps
  else
    strokeSize[i] = strokeSize[(i - 1)] - strokeSteps

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

    sin1 = ((sin (i * slice) - HALF_PI) + 1) * 0.5
    sin2 = ((sin (i + frameCount) * 0.01) + 1) * 0.5

    range1 = lerp (sphereSize / TWO_PI) * -1, (sphereSize / TWO_PI), sin1
    range2 = lerp 0, sphereSize, sin1
    range3 = lerp 0, 2, strokeSize[i]     # Spessore linea
    range4 = lerp 0, 256, strokeSize[i]   # Opacita linea
    range5 = lerp 0, 256, sin2            # Colore linea

    animationFrom = 0
    animationTo = (linesPosition[i] - linesPosition[i + 1])

    range6 = lerp animationFrom, animationTo, animationCount            # Movimento linea

    strokeWeight range3
    stroke range5, 256, 256, range4


    bezier (sphereSize / 2) + paddingSize, 0 + paddingSize,
           range1 + range2 + paddingSize + range6, 0 + paddingSize,
           range1 + range2 + paddingSize + range6, sphereSize + paddingSize,
           (sphereSize / 2) + paddingSize, sphereSize + paddingSize

    bezier 0 + paddingSize, (sphereSize / 2) + paddingSize,
           0 + paddingSize, range1 + range2 + paddingSize + range6,
           sphereSize + paddingSize, range1 + range2 + paddingSize + range6,
           sphereSize + paddingSize, (sphereSize / 2) + paddingSize


    if frameCount is 1 then
      linesPosition[i] = range1 + range2


  animationCount += animationSpeed

  #console.log count

  if animationCount > 1 then animationCount := 0

  #if frameCount is 1 then
    #console.log linesPosition
    #noLoop!



mousePressed = !-> noLoop!
