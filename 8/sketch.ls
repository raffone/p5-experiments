canvasSize = 256
pixelSize = 4
colorRange = 100

position =
  for to canvasSize
    for to canvasSize
      0

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasSize, canvasSize
  noStroke!
  colorMode HSB, colorRange

# --------------------------------------------------------------------------

draw = !->
  for y til canvasSize by pixelSize
    for x til canvasSize by pixelSize
      fill 50, 100, constrain position[x][y], 0, colorRange
      rect x, y, pixelSize, pixelSize

# --------------------------------------------------------------------------

mousePressed = mouseDragged = !->
  if mouseX >= 0 and
     mouseX <= canvasSize and
     mouseY >= 0 and
     mouseY <= canvasSize

    baseX = mouseX - (mouseX % pixelSize)
    baseY = mouseY - (mouseY % pixelSize)

    for x to pixelSize
      for y to pixelSize
        position[baseX - pixelSize + x][baseY - pixelSize + y] += 20

keyPressed = !-> noLoop!
