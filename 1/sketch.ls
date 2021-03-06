base1 = 1
base2 = 1
base3 = 1
dim   = 400
ang   = 90

# --------------------------------------------------------------------------

setup = !->
  createCanvas dim, dim
  noFill!

# --------------------------------------------------------------------------

draw = !->
  clear!
  background 245

  n1 = base1
  n2 = base2
  n3 = base3

  for i from 1 to ang
    n1  += PI / (ang / 2)
    n2  += PI / (ang / 2)
    n3  += PI / (ang / 2)

    r = Math.floor ( Math.abs cos n2 + 1 ) * 250
    g = Math.floor ( Math.abs cos n2 + 2 ) * 250
    b = Math.floor ( Math.abs cos n2 + 3 ) * 250
    strokeWeight <| Math.abs <| sin n2

    om = ( dim / 2 ) + ( sin n1 ) * ( dim / 4 )
    vm = ( dim / 2 ) + ( cos n1 ) * ( dim / 4 )

    od = ( dim / 5 ) + ( cos n1 ) * (dim / 8) * (sin n3 * 2)
    vd = ( dim / 5 ) + ( sin n1 ) * (dim / 8) * (cos n3 * 2)

    stroke r,g,b
    ellipse om, vm, od, vd

  base1 += 0.20
  base2 += 0.22
  base3 += 0.23


mousePressed = !-> noLoop!
