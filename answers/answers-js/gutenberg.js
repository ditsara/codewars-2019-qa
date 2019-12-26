const fs = require("fs")
const letters = {a: 35,
 b: 8,
 c: 8,
 d: 20,
 e: 70,
 f: 20,
 g: 10,
 h: 40,
 i: 35,
 k: 5,
 l: 20,
 m: 8,
 n: 30,
 o: 40,
 p: 10,
 q: 2,
 r: 35,
 s: 35,
 t: 40,
 u: 15,
 v: 5,
 w: 18,
 y: 8,
 z: 2}
let pageLetters = {...letters}
const a2z = Object.keys(letters)
const beowulf = fs.readFileSync("../../questions/gutenberg/beowulf.txt","ascii").split("").map(c => c.toLowerCase()).filter(c => a2z.includes(c))
let pages = 1
let index = -1
while (index<beowulf.length) {
  index++
  let c = beowulf[index]
  pageLetters[c]--
  if (pageLetters[c]<0) {
    pages++
    pageLetters = {...letters}
    index--
  }
}
console.log(pages)
