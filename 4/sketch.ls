basePos = 0
baseDim = 0

# --------------------------------------------------------------------------

setup = !->
  createCanvas 400, 400
  noStroke!
  colorMode HSB, 255

# --------------------------------------------------------------------------

draw = !->
  clear!
  background 245

  pos = basePos
  dim = baseDim

  k = 0

  for i from 255 to 0 by -1
    #fill i * 6
    #stroke i * 6

    fill i, 255, 225
    #fill 245
    stroke i, 220, 255

    f = (frameCount * 0.05) * -1

    offsetPosX = (sin pos * 0.02) * 100
    offsetPosY = (cos pos * 0.02) * 100
    offsetWave = (sin (i * 0.5) + f) * 10
    offsetDim  = (sin pos * 0.02) * 40

    ellipse 200 + offsetPosX + offsetWave, 200 + offsetPosY, 50 + offsetDim, 50 + offsetDim

    pos++

  basePos++
  baseDim++

mousePressed = !-> noLoop!
