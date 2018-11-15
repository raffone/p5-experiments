tileSize = 32
tileNumX = 19
tileNumY = 12

canvasWidth  = tileSize * tileNumX
canvasHeight = tileSize * tileNumY

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasWidth, canvasHeight
  background 180
  #noStroke!
  fill 255

  for x to tileNumX
    for y to tileNumY
      posX = x * tileSize
      posY = y * tileSize
      console.log \x, x, \y, y

      fill 255
      fill 200 if x is 9 and y is 6


      rect posX, posY, tileSize, tileSize



# --------------------------------------------------------------------------

draw = !->
  #updatePixels!


# --------------------------------------------------------------------------

keyPressed = mousePressed = -> noLoop!
