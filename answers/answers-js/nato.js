const alphabet = ["ALFA", "BRAVO", "CHARLIE", "DELTA", "ECHO", "FOXTROT", "GOLF", "HOTEL", "INDIA", "JULIETT", "KILO", "LIMA", "MIKE", "NOVEMBER", "OSCAR", "PAPA", "QUEBEC", "ROMEO", "SIERRA", "TANGO", "UNIFORM", "VICTOR", "WHISKEY", "XRAY", "YANKEE", "ZULU"]
const bangkok = "KRUNGTHEPMAHANAKHONAMONRATTANAKOSINMAHINTHARAYUTTHAYAMAHADILOKPHOPNOPPHARATRATCHATHANIBURIROMUDOMRATCHANIWETMAHASATHANAMONPHIMANAWATANSATHITSAKKATHATTIYAWITSANUKAMPRASIT"
const letters = bangkok.split("")
const length = letters.reduce((memo, letter)=>{
  return memo + alphabet.filter(word => word.startsWith(letter))[0].length
}, 0)
console.log(length)