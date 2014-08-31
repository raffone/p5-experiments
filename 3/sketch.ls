dim = 400

baseX = 0
baseY = 0
baseZ = 0
baseK = 40


#gino = 3 / 360

# --------------------------------------------------------------------------

setup = !->
  createCanvas dim, dim
  #noStroke!
  background 0,45,90

# --------------------------------------------------------------------------

draw = !->

  clear!
  background 0,45,90

  x = baseX
  y = baseY
  z = sin baseZ++ * 0.01

  i = 0

  F_x = 0
  F_y = 0

  xPI = (Math.PI / 90)
  yPI = (Math.PI / 360)


  loop

    _x = round(((sin x++ * xPI + z) * 160) + 200)
    _y = round(((cos y++ * yPI - z) * 160) + 200)

    stroke 255,_y,_x
    point _x, _y

    #for k til 32 by 4
      #point _x + ( k / 2 ), _y + ( k / 4 )

    if i is 0
      F_x = _x
      F_y = _y

    break if i++ > 200 and F_x is _x and F_y is _y
    #break if F_x is _x and F_y is _y

  baseX += 0.4

mousePressed = !-> noLoop!
