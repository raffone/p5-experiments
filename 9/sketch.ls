canvasSize = 256
pixelSize = 8
colorRange = 100
currShape = 0
reverse = false

shapes =
  [
    [
      [0 0 0]
      [0 2 0]
      [0 0 0]
    ]
    [
      [2 2 2]
      [2 1 2]
      [2 2 2]
    ]
    [
      [0 2 2 2 0]
      [2 1 1 1 2]
      [2 1 2 1 2]
      [2 1 1 1 2]
      [0 2 2 2 0]
    ]
    [
      [0 0 2 2 2 0 0]
      [0 2 1 1 1 2 0]
      [2 1 1 2 1 1 2]
      [2 1 2 1 2 1 2]
      [2 1 1 2 1 1 2]
      [0 2 1 1 1 2 0]
      [0 0 2 2 2 0 0]
    ]
    [
      [0 0 0 2 2 2 0 0 0]
      [0 2 2 1 1 1 2 2 0]
      [0 2 1 1 1 1 1 2 0]
      [2 1 1 2 2 2 1 1 2]
      [2 1 1 2 1 2 1 1 2]
      [2 1 1 2 2 2 1 1 2]
      [0 2 1 1 1 1 1 2 0]
      [0 2 2 1 1 1 2 2 0]
      [0 0 0 2 2 2 0 0 0]
    ]
  ]

position =
  for to canvasSize
    for to canvasSize
      0

# --------------------------------------------------------------------------

getShape = ->
  shape = shapes[floor currShape]
  shape.size = -((shape.length - 1) / 2) * pixelSize

  currShape += 0.1  if reverse is false
  currShape -= 0.1  if reverse is true

  reverse := true   if floor(currShape) is shapes.length - 1
  reverse := false  if floor(currShape) is 0

  shape

getCoord = (basePos,shapeSize,mult) ->
  basePos + (shapeSize + (pixelSize * mult))

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasSize, canvasSize
  colorMode HSB, colorRange
  noStroke!

# --------------------------------------------------------------------------

draw = !->
  #stroke 0 0 20

  for y til canvasSize by pixelSize
    for x til canvasSize by pixelSize

      fill lerp(60, 100, position[x][y] / colorRange), colorRange, position[x][y]

      rect x, y, pixelSize, pixelSize

      position[x][y] -= 2 if position[x][y] > 0

# --------------------------------------------------------------------------

mousePressed = mouseDragged = !->
  if mouseX >= 0 and
     mouseX <= canvasSize and
     mouseY >= 0 and
     mouseY <= canvasSize

    baseX = mouseX - (mouseX % pixelSize)
    baseY = mouseY - (mouseY % pixelSize)

    shape = getShape!

    for shapeX til shape.length
      for shapeY til shape.length

        posX = getCoord baseX, shape.size, shapeX
        posY = getCoord baseY, shape.size, shapeY

        position[posX][posY] = 100  if shape[shapeX][shapeY] is 2
        position[posX][posY] = 0    if shape[shapeX][shapeY] is 1

# --------------------------------------------------------------------------

keyPressed = !-> noLoop!

