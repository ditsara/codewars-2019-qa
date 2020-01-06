const repeat = function(letter, num) {
  let out = ""
  for (var i = 0;i<num;i++) {
    out+=letter
  }
  return out
}

let out = "a"+repeat("m", 20)+"ad" //go to bottom left
out+=repeat("m",16)+"r" //first vertical line
for (var i = 16;i>0;i-=2) {
  out+=repeat("ummd",i)+"r" //horizontal dashed line
  out+=repeat("m",i)+"r" //vertical line
}
console.log(out)
