
let p = 6
let w = (1080 / 2) / p
let h = (1920 / 2) / p
let r = 360
let concurrentPoints = 50
let hueIncrement = 10
let hueIncrementAnimation = 1





// let currentHue = 0
let direction = [
  [1, 0], // right
  [0, 1], // down
  [-1, 0], // left
  [0, -1] // up
]

let startingPoint = [p * w / 2, p * h / 2]


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
let drawnPoints = []
let finished = false

function setup() {
  createCanvas(p * w, p * h);
  colorMode(HSB, r);
  textAlign(CENTER, CENTER);
  textFont('monospace', p);
  textStyle(NORMAL);

  noStroke();


  background(0);


  // for (let i = 0; i < concurrentPoints; i++) {
  //   let randomPoint = chooseRandomPoint()
  //   currentPoints.push(randomPoint)
  // }

  // add the center point to the curren points
  let startingPointString = `${startingPoint[0]}-${startingPoint[1]}`
  console.log('%csketch.js line:98 startingPoint', 'color: #007acc;', startingPoint);
  currentPoints.push([startingPoint, 0])


  // draw a white square in th CENTER
  // fill(255);
  // rect(p * w / 2, p * h / 2, p, p);




}


function draw() {


  // console.log('%csketch.js line:53 currentPoint', 'color: #007acc;', currentPoint);

  // for each current ppoint
  // for (let i = 0; i < Object.keys(currentPoints).length; i++) {
  for (let i = 0; i < currentPoints.length; i++) {
  // for (let currentPointKey in currentPoints) {

    // console.log('%csketch.js line:93 currentPoints[i]', 'color: #007acc;', currentPoints[i]);
    // console.log('%csketch.js line:123 currentPoints', 'color: #007acc;', currentPoints);
    // console.log('%csketch.js line:123 currentPoints[i]', 'color: #007acc;', currentPoints[i]);
    let [currentPoint, hue] = currentPoints[i]

    // console.log('%csketch.js line:127 currentPoint', 'color: #007acc;', currentPoint);
    // console.log('%csketch.js line:107 currentPoint', 'color: #007acc;', currentPoint);
    let currentPointKey = `${currentPoint[0]}-${currentPoint[1]}`

    // if yes, draw a square with currentHue
    let currentHue = (hue + hueIncrement) % r
    fill(currentHue, r, r)
    rect(currentPoint[0], currentPoint[1], p, p);

    // increment point hue
    currentPoints[i][1] = currentHue

    // points.push([currentPoint, currentHue])

    // get index of current point
    delete allPoints[currentPointKey]
    // delete currentPoints[currentPointKey]

    // console.log('%csketch.js line:140 allPoints.length', 'color: #007acc;', Object.keys(allPoints).length);

    // let index = allPoints.indexOf(currentPointKey)
    // remove current point from the list of all points
    // allPoints.splice(index, 1)


    // find the next adiacent empty point in all for directions
    let adiacentPoints = []
    for (let i = 0; i < direction.length; i++) {
      let adiacentPoint = [currentPoint[0] + (direction[i][0] * p), currentPoint[1] + (direction[i][1] * p)]
      let adiacentPointString = `${adiacentPoint[0]}-${adiacentPoint[1]}`
      if (adiacentPointString in allPoints) {
        // adiacentPoints.push(adiacentPointString)
        adiacentPoints.push(adiacentPoint)
      }
    }

    if (adiacentPoints.length !== 0) {


      // let randomAdiacentPointKey = adiacentPoints[floor(random(adiacentPoints.length))]
      // let randomAdiacentPoint = randomAdiacentPointKey.split('-').map(Number)
      // currentPoints[i] = [randomAdiacentPoint, currentHue]


      // select one or more adiacent points at random
      // let randomAdiacentPoints = []
      // let randomAdiacentPointsStrings = []
      // let numberOfAdiacentPoints = floor(random(1, adiacentPoints.length + 1))
      // for (let i = 0; i < numberOfAdiacentPoints; i++) {
      //   let randomAdiacentPointKey = adiacentPoints[floor(random(adiacentPoints.length))]
      //   let randomAdiacentPoint = randomAdiacentPointKey.split('-').map(Number)
      //   randomAdiacentPoints.push(randomAdiacentPoint)
      //   randomAdiacentPointsStrings.push(randomAdiacentPointKey)


      // }

      // randomize adiacentPoints and take between 1 and 4
      let randomAdiacentPoints = shuffle(adiacentPoints).slice(0, floor(random(1, 3)))
      // let randomAdiacentPoints = adiacentPoints


      // console.log('%csketch.js line:176 randomAdiacentPoints', 'color: #007acc;', randomAdiacentPoints);


      // use the first adiacent point as current point
      // currentPoints[i] = [randomAdiacentPoints[0], currentHue]

      let randomAdiacentPointKey = `${randomAdiacentPoints[0][0]}-${randomAdiacentPoints[0][1]}`
      currentPoints[i] = [randomAdiacentPoints[0], currentHue]
      delete allPoints[randomAdiacentPointKey]


      // use the other adiacent points as new current points
      for (let i = 1; i < randomAdiacentPoints.length; i++) {
        // currentPoints.push([randomAdiacentPoints[i], currentHue])
        let randomAdiacentPoint = randomAdiacentPoints[i]
        let randomAdiacentPointKey = `${randomAdiacentPoints[i][0]}-${randomAdiacentPoints[i][1]}`
        // currentPoints[randomAdiacentPointKey] = [randomAdiacentPoint, currentHue]
        currentPoints.push([randomAdiacentPoint, currentHue])
        delete allPoints[randomAdiacentPointKey]
      }

    } else {

      // console.log('YOLO?!');

      // console.log('no adiacent points');
      let randomPoint = chooseRandomPoint()

      // if random point is undefined remove current point from current points
      if (randomPoint === undefined) {
        // remopve currentPoint
        currentPoints.splice(i, 1)
          
      } else {

        currentPoints[i] = randomPoint

        

        // remove from current points array
        // currentPoints.splice(i, 1)

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
    // currentPointKey = randomAdiacentPointKey

    // }

  }

  // if (currentPoints.length === 0) {
  //   finished = true
  // }

  // for (let i = 0; i < points.length; i++) {

  //   let pointString = `${points[i][0][0]}-${points[i][0][1]}`
  //   if (drawnPoints.includes(pointString)) {
  //     continue
  //   }

  //   let point = points[i]
  //   let hue = point[1]
  //   fill(hue, r, r)
  //   rect(point[0][0], point[0][1], p, p);

  //   drawnPoints.push(pointString)


  //   // if finished increment point hue
  //   // if (finished) {
  //   //   point[1] = (point[1] + hueIncrementAnimation) % r
  //   // }
  // }



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
