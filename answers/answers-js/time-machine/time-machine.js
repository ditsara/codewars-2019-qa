let moment = require("moment")

let TUESDAY = 2
let mutate = m => {
  if (m.day()==TUESDAY) {
    return m.clone().subtract(2, "day")
  } else if (m.format("MM-DD")=="02-29") {
    throw("Explode in year "+m.format("YYYY"))
  } else {
    return m.clone().add(1, "year")
  }
}
let time = moment("2019-12-14")
while (true) {
  console.log(time.format("YYYY-MM-DD"))
  time = mutate(time)
}

//Explode in year 5148