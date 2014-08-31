px = 8
dim = px * 48
margin = px * 2
pos = 0

# --------------------------------------------------------------------------

setup = !->
  createCanvas dim + margin, dim + margin
  noStroke!

# --------------------------------------------------------------------------

draw = !->
  clear!

  algo = (max)->
    sX = (cos pos * 0.02) * 60
    sY = (sin pos * 0.02) * 60
    sZ = lerp 20, 10, abs (sin pos * 0.0025)

    (max / 2) + ((max / 2) * sin( sqrt(
      (x + sX - dim / 2.0) * (x + sX - dim / 2.0) +
      (y + sY - dim / 2.0) * (y + sY - dim / 2.0)
    ) / sZ))


  for x to dim by px
    for y to dim by px
      r = algo 256
      s = (algo px - 2) + 3
      offset =  (px - s) / 2

      fill r, 0, 200
      rect x - offset + (margin / 2), y - offset + (margin / 2), s, s

  pos++

mousePressed = !-> noLoop!
