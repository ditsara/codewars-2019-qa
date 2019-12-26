//note this is using the username "javascript"
//ruby tree.rb gen javascript > data.json
let tree = require("./data.json")
let bestSentences = ""
let bestScore = 0
//recursively find all possible paths through the tree
const findPaths = (node, sentence, score)=>{
  let paths = []
  sentence += node.name+" "
  score += node.score
  if (node.children.length>0) {
    for (let child of node.children) {
      findPaths(child, sentence, score)
    }
  } else {
    if (score>bestScore) {
        bestScore = score
        bestSentence = sentence
    }
  }
}
let sentences = findPaths(tree,"", 0)
console.log(bestScore, bestSentence)