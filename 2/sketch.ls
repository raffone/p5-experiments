dim = 390

# --------------------------------------------------------------------------

setup = !->
  createCanvas dim, dim
  noStroke!
  colorMode(HSB, 255)

# --------------------------------------------------------------------------

draw = !->

  nX = 0
  nY = 0

  getColor = -> constrain _, 0, 255 <| Math.round <| noise(nX++  + ( frameCount * 0.01), nY++  + ( frameCount * 0.02)) * 350

  for x to dim by 6
    for y to dim by 6
      fill getColor!,210,240
      rect x,y,6,6

mousePressed = !-> noLoop!
