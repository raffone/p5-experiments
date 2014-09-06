canvasSize = 100
pixelArrayLenght = Math.pow(8,2) * 4

value = 0
position =
  for to canvasSize
    for to canvasSize
      #[0 1 2 255]
      for to 4
        255

#console.log position

# --------------------------------------------------------------------------

setup = !->
  createCanvas canvasSize, canvasSize
  noFill!
  loadPixels!

# --------------------------------------------------------------------------

draw = !->
  count = 0

  for y til canvasSize
    for x til canvasSize

      pixels[count] = position[x][y][0]
      pixels[count + 1] = position[x][y][1]
      pixels[count + 2] = position[x][y][2]
      pixels[count + 3] = position[x][y][3]

      count += 4

  updatePixels!

# --------------------------------------------------------------------------

mouseMoved = !->
  if mouseX >= 0 and
     mouseX <= canvasSize and
     mouseY >= 0 and
     mouseY <= canvasSize

    position[mouseX][mouseY] = [0 0 0 255]
    console.log mouseX, mouseY

#mousePressed = !-> noLoop!
#keyPressed = !-> noLoop!
