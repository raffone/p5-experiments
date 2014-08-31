colors = []
count = 0
gradient = []
pos = 0
px = 8
dim = px * 64
margin = 0
zoom = 0
colorRange = 255


convertHex = (hex)->
  hex = hex.replace('#','');
  r = parseInt hex.substring(0,2), 16
  g = parseInt hex.substring(2,4), 16
  b = parseInt hex.substring(4,6), 16

  color r,g,b,255

# --------------------------------------------------------------------------

setup = !->
  createCanvas dim, dim
  noiseSeed 1
  noStroke!

  colors =
    \#0a3852
    #\#de1ce6
    \#611ce6
    #\#1c46e6
    \#ffe5ec

  steps = 256 / (colors.length - 1)

  for k to colorRange by steps
    for i til steps
      _k = if k is 0 then 0 else k / steps
      _amount = i * (100 / steps) * 0.01

      gradient[count++] = lerpColor convertHex(colors[(_k)]), convertHex(colors[(_k + 1)]), _amount



# --------------------------------------------------------------------------

draw = !->
  clear!
  background convertHex \#222222

  getTexture = (x,y,z)->
    #nZ = (0.01 * (abs sin z * 0.01)) + 0.06
    #nX = x * nZ
    #nY = y * nZ
    nX = x * 0.04
    nY = y * 0.04


    #sX = sin ( pos * 0.004 ) * 5
    #sY = cos ( pos * 0.004 ) * 5
    sX = 0
    sY = pos * 0.02

    round 255 * noise (nX + sX), (nY + sY)


  for x to dim by px
    for y to dim by px
      texture =  getTexture x,y

      fill gradient[texture]
      variation = (((1 / 255 ) * texture) * px ) + 1

      ellipse x + (px / 2), y + (px / 2), variation - margin , variation - margin
  pos++
  zoom++

mousePressed = !-> noLoop!
