const fs = require("fs")
data = fs.readFileSync("../../questions/grid/directions.txt","ascii")
const lines = data.split("\n")
let x = 0, y = 0
for (let line of lines) {
  let direction = line.substr(0,1)
  let amount = parseInt(line.split(" ")[1])
  switch (direction) {
    case "N":
      y+=amount; break;
    case "S":
      y-=amount; break;
    case "E":
      x+=amount; break;
    case "W":
      x-=amount; break;
  }
}
console.log(x, y)