
let p = 5
let w = (1080 / 2) / p
let h = (1920 / 2) / p
let r = 360



let currentHue = 0
let direction = [
  [1, 0], // right
  [0, 1], // down
  [-1, 0], // left
  [0, -1] // up
]

// let startingPoint = [p * w / 2, p * h / 2]


let allPoints = []
for (let i = 0; i < w; i++) {
  for (let j = 0; j < h; j++) {
    let point = [i * p, j * p]
    let pointString = `${point[0]}-${point[1]}`
    allPoints.push(pointString)
  }
}


// choose 4 random points
function chooseRandomPoint() {
  // if all point is empty, return
  if (allPoints.length === 0) {
    return
  }

  let randomPointString = allPoints[floor(random(allPoints.length))]
  let randomPoint = randomPointString.split('-').map(Number)

  // if (!allPoints.includes(randomPointString)) {
  //   return chooseRandomPoint()
  // }


  // remove random point from the list of all points
  let index = allPoints.indexOf(randomPointString)
  allPoints.splice(index, 1)

  return randomPoint
}

let currentPoints = []
for (let i = 0; i < 6; i++) {
  let randomPoint = chooseRandomPoint()
  currentPoints.push(randomPoint)
}


let points = []

function setup() {
  createCanvas(p * w, p * h);
  colorMode(HSB, r);
  textAlign(CENTER, CENTER);
  textFont('monospace', p);
  textStyle(NORMAL);

  noStroke();


  background(0);

  // draw a white square in th CENTER
  // fill(255);
  // rect(p * w / 2, p * h / 2, p, p);




}


function draw() {


  // console.log('%csketch.js line:53 currentPoint', 'color: #007acc;', currentPoint);

  // for each current ppoint
  for (let i = 0; i < currentPoints.length; i++) {
    let currentPoint = currentPoints[i]
    let currentPointString = `${currentPoint[0]}-${currentPoint[1]}`



    // let dir = direction[floor(random(4))]


    // check if the point is inside the canvas
    // if (!allPoints.includes(currentPointString)) {
    // console.log('nnon incluso skippa');


    // // move in that direction
    // currentPoint = [currentPoint[0] + (dir[0] * p), currentPoint[1] + (dir[1] * p)]
    // currentPointString = `${currentPoint[0]}-${currentPoint[1]}`

    // if (!allPoints.includes(currentPointString)) {


    // if not choose a random point from the list of all points
    // let randomPointString = allPoints[floor(random(allPoints.length))]
    // let randomPoint = randomPointString.split('-').map(Number)


    // update current point
    // currentPoints[i] = chooseRandomPoint()

    // currentPoint = randomPoint
    // currentPointString = randomPointString
    // } else {
    //   return 
    // }

    // } else {
    // if yes, draw a square with currentHue
    currentHue = (currentHue + 1) % r
    fill(currentHue, r, r)
    rect(currentPoint[0], currentPoint[1], p, p);

    // points.push([...currentPoint, currentHue])


    // add the point to the list of visited points

    // remove current point from the list of all points
    // get index of current point
    let index = allPoints.indexOf(currentPointString)
    // remove current point from the list of all points
    allPoints.splice(index, 1)


    // find the next adiacent empty point in all for directions
    let adiacentPoints = []
    for (let i = 0; i < direction.length; i++) {
      let adiacentPoint = [currentPoint[0] + (direction[i][0] * p), currentPoint[1] + (direction[i][1] * p)]
      let adiacentPointString = `${adiacentPoint[0]}-${adiacentPoint[1]}`
      if (allPoints.includes(adiacentPointString)) {
        adiacentPoints.push(adiacentPointString)
      }
    }

    if (adiacentPoints.length === 0) {
      // console.log('no adiacent points');
      let randomPoint = chooseRandomPoint()

      // if random point is undefined remove current point from current points
      if (randomPoint === undefined) {
        currentPoints.splice(i, 1)
      }


      currentPoints[i] = randomPoint
    }

    // choose an adiacent point at random
    let randomAdiacentPointString = adiacentPoints[floor(random(adiacentPoints.length))]
    let randomAdiacentPoint = randomAdiacentPointString.split('-').map(Number)

    // update current point
    currentPoints[i] = randomAdiacentPoint


    // currentPoint = randomAdiacentPoint
    // currentPointString = randomAdiacentPointString

    // }

  }



}


// function draw() {

//   for (let i = 0; i < points.length; i++) {
//     let point = points[i]
//     let hue = point[2]
//     fill(hue, r, r)
//     rect(point[0], point[1], p, p);
//     // increment point hue
//     point[2] = (point[2] + 5) % r
//   }



// }
