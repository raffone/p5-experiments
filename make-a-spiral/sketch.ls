spiralize = (size) ->
  currDir = 1
  currPos = [1 1]

  mov = [
    [-1  0]
    [ 0  1]
    [ 1  0]
    [ 0 -1]
  ]

  look = [
    [-2 0 0  0]
    [ 0 2 0  0]
    [ 0 0 2  0]
    [ 0 0 0 -2]
  ]


  matrix = for til size + 2
    for til size + 2
      0

  activateCurrentCell = !->
    matrix[currPos[0]][currPos[1]] = 1

  nextPosition = !->
    currPos[1] += mov[currDir][1]
    currPos[0] += mov[currDir][0]

  nextDirection = !->
    if ++currDir is 4 then currDir := 0


  lookAhead = !->
    if matrix[currPos[0] + look[currDir][0]][currPos[1]] is 0 and
       matrix[currPos[0] + look[currDir][2]][currPos[1]] is 0 and
       matrix[currPos[0]][currPos[1] + look[currDir][1]] is 0 and
       matrix[currPos[0]][currPos[1] + look[currDir][3]] is 0
      return true
    else
      return false

  while true
    for i til size - 1

      if lookAhead!
        activateCurrentCell!
      else
        break

      nextPosition!
    nextDirection!

    if i <= 1
      activateCurrentCell!
      break

  matrix.pop!
  matrix.shift!

  for row in matrix
    row.pop!
    row.shift!

  return matrix

console.log spiralize 5

#drawSpiral = (arr) ->
  #arr.join '\n'


#console.log drawSpiral createSpiral 8


#console.log showGrid [[1,1,1,1,1],[0,0,0,0,1],[1,1,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
