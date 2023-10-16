
let p = 6
let w = (1080 / 2) / p
let h = (1920 / 2) / p
let r = 360
let concurrentPoints = 50
let hueIncrement = 3
let hueIncrementAnimation = 1


// let currentHue = 0
let direction = [
  [1, 0], // right
  [0, 1], // down
  [-1, 0], // left
  [0, -1] // up
]

// let startingPoint = [p * w / 2, p * h / 2]


let allPoints = {}
for (let i = 0; i < w; i++) {
  for (let j = 0; j < h; j++) {
    let point = [i * p, j * p]
    let pointString = `${point[0]}-${point[1]}`
    // allPoints.push(pointString)
    allPoints[pointString] = point
  }
}

// console.log(allPoints);
// console.log(allPoints.length, w * h);


// choose 4 random points
function chooseRandomPoint() {
  // if all point is empty, return
  if (Object.keys(allPoints).length === 0) {
    console.log('FINISHED');
    return
  }

  // let randomPointString = allPoints[floor(random(Object.keys(allPoints).length))]
  let randomPointString = random(Object.keys(allPoints))
  let randomPoint = allPoints[randomPointString]

  // console.log('yolo', randomPoint);

  // if (!allPoints.includes(randomPointString)) {
  //   return chooseRandomPoint()
  // }


  // remove random point from the list of all points
  delete allPoints[randomPointString]
  
  // let index = allPoints.indexOf(randomPointString)
  // allPoints.splice(index, 1)



  let hue = 0

  return [randomPoint, hue]
}

let currentPoints = []


let points = []
let finished = false

function setup() {
  createCanvas(p * w, p * h);
  colorMode(HSB, r);
  textAlign(CENTER, CENTER);
  textFont('monospace', p);
  textStyle(NORMAL);

  noStroke();


  background(0);


  for (let i = 0; i < concurrentPoints; i++) {
    let randomPoint = chooseRandomPoint()
    currentPoints.push(randomPoint)
  }

  // draw a white square in th CENTER
  // fill(255);
  // rect(p * w / 2, p * h / 2, p, p);




}


function draw() {


  // console.log('%csketch.js line:53 currentPoint', 'color: #007acc;', currentPoint);

  // for each current ppoint
  for (let i = 0; i < currentPoints.length; i++) {

    // console.log('%csketch.js line:93 currentPoints[i]', 'color: #007acc;', currentPoints[i]);
    let [currentPoint, hue] = currentPoints[i]
    // console.log('%csketch.js line:107 currentPoint', 'color: #007acc;', currentPoint);
    let currentPointString = `${currentPoint[0]}-${currentPoint[1]}`


    // if yes, draw a square with currentHue
    let currentHue = (hue + hueIncrement) % r
    // fill(currentHue, r, r)
    // rect(currentPoint[0], currentPoint[1], p, p);

    // increment point hue
    currentPoints[i][1] = currentHue

    points.push([currentPoint, currentHue])

    // get index of current point
    delete allPoints[currentPointString]

    // let index = allPoints.indexOf(currentPointString)
    // remove current point from the list of all points
    // allPoints.splice(index, 1)


    // find the next adiacent empty point in all for directions
    let adiacentPoints = []
    for (let i = 0; i < direction.length; i++) {
      let adiacentPoint = [currentPoint[0] + (direction[i][0] * p), currentPoint[1] + (direction[i][1] * p)]
      let adiacentPointString = `${adiacentPoint[0]}-${adiacentPoint[1]}`
      if (adiacentPointString in allPoints) {
        adiacentPoints.push(adiacentPointString)
      }
    }

    if (adiacentPoints.length !== 0) {


      let randomAdiacentPointString = adiacentPoints[floor(random(adiacentPoints.length))]
      let randomAdiacentPoint = randomAdiacentPointString.split('-').map(Number)
      currentPoints[i] = [randomAdiacentPoint, currentHue]


      // select one or more adiacent points at random
      // let randomAdiacentPoints = []
      // let randomAdiacentPointsStrings = []
      // let numberOfAdiacentPoints = floor(random(1, adiacentPoints.length + 1))
      // for (let i = 0; i < numberOfAdiacentPoints; i++) {
      //   let randomAdiacentPointString = adiacentPoints[floor(random(adiacentPoints.length))]
      //   let randomAdiacentPoint = randomAdiacentPointString.split('-').map(Number)
      //   randomAdiacentPoints.push(randomAdiacentPoint)
      //   randomAdiacentPointsStrings.push(randomAdiacentPointString)

       
      // }

      // // use the first adiacent point as current point
      // currentPoints[i] = [randomAdiacentPoints[0], currentHue]

      // // use the other adiacent points as new current points
      // for (let i = 1; i < randomAdiacentPoints.length; i++) {
      //   currentPoints.push([randomAdiacentPoints[i], currentHue])
      // }

    } else {

      // console.log('no adiacent points');
      let randomPoint = chooseRandomPoint()

      // if random point is undefined remove current point from current points
      if (randomPoint === undefined) {
        // remopve currentPoint
        currentPoints.splice(i, 1)
      } else {

        currentPoints[i] = randomPoint
      }

      // // add all adiacentPoint to the list of current points
      // for (let i = 0; i < adiacentPoints.length; i++) {
      //   // let adiacentPointString = adiacentPoints[i]
      //   let adiacentPoint = adiacentPoints[i]
      //   currentPoints.push([...adiacentPoint, currentHue])
      // }


      // // // choose an adiacent point at random


    }


    // currentPoint = randomAdiacentPoint
    // currentPointString = randomAdiacentPointString

    // }

  }

  if (currentPoints.length === 0) {
    finished = true
  }

  for (let i = 0; i < points.length; i++) {
    let point = points[i]
    let hue = point[1]
    fill(hue, r, r)
    rect(point[0][0], point[0][1], p, p);


    // if finished increment point hue
    if (finished) {
      point[1] = (point[1] + hueIncrementAnimation) % r
    }
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
