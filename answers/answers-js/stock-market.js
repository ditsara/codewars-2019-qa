const fs = require("fs")
const stocks = fs.readFileSync("../questions/stock-market/sp500.txt","ascii").split("\n")
const days = 60
let vals = []
for (let row of stocks) {
  let date = row.substr(0,10)
  let value = row.substr(14)
  try {
    vals.push({date, value:parseFloat(value)})
  } catch(e) {
  
  }
}
//console.dir(vals)
let best = -Infinity
let worst = Infinity
let bestDate = null
let worstDate = null
for (let i = 0; i<vals.length-days-1;i++) {
  let start = vals[i].value
  let end = vals[i+days].value
  if (end/start>best) {
    best = end/start
    bestDate = vals[i].date
  }
  if (end/start<worst) {
    worst = end/start
    worstDate = vals[i].date
  }
}
console.log(`Best ${days} day period was ${bestDate} (${(best-1)*100}%) and worst was ${worstDate} (${(worst-1)*100}%)`)