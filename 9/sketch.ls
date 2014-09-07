canvasSize = 256
pixelSize = 8
colorRange = 100

shape = [[0 0 2 2 2 0 0]
         [0 2 1 1 1 2 0]
         [2 1 1 2 1 1 2]
         [2 1 2 1 2 1 2]
         [2 1 1 2 1 1 2]
         [0 2 1 1 1 2 0]
         [0 0 2 2 2 0 0]]

shapeSize = -((shape.length - 1) / 2) * pixelSize

position =
  for to canvasSize
    for to canvasSize
      0

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasSize, canvasSize
  #noStroke!
  colorMode HSB, colorRange

# --------------------------------------------------------------------------

draw = !->
  stroke 0 0 20

  for y til canvasSize by pixelSize
    for x til canvasSize by pixelSize
      fill 33, 66, position[x][y]
      rect x, y, pixelSize, pixelSize

      position[x][y] -= 4 if position[x][y] > 0

# --------------------------------------------------------------------------

mousePressed = mouseDragged = !->
  if mouseX >= 0 and
     mouseX <= canvasSize and
     mouseY >= 0 and
     mouseY <= canvasSize

    baseX = mouseX - (mouseX % pixelSize)
    baseY = mouseY - (mouseY % pixelSize)

    getCoord = (base,mult) -> (base + (shapeSize + (pixelSize * mult)))

    for shapeX til shape.length
      for shapeY til shape.length

        posX = getCoord baseX, shapeX
        posY = getCoord baseY, shapeY

        position[posX][posY] = 100  if shape[shapeX][shapeY] is 2
        position[posX][posY] = 0    if shape[shapeX][shapeY] is 1

keyPressed = !-> noLoop!
