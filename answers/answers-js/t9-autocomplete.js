const fs = require("fs")
let dict = {"2":"ABC",
"3":"DEF",
"4":"GHI",
"5":"JKL",
"6":"MNO",
"7":"PQRS",
"8":"TUV",
"9":"WXYZ"}
let contacts = []
let data = fs.readFileSync("../questions/t9-autocomplete/contacts.txt","ascii")
for (let row of data.split("\n")) {
  let name = row.substr(0, 23).trim()
  let phone = row.substr(23)
  if (name) {
    contacts.push({name:name.toUpperCase(), phone:phone.replace(/-/g,'')})
  }
}
//names.sort()
const findT9 = (num) => {
  let chars = num.split("")
  let matchingContacts = contacts.filter(c => {
    for (let i = 0;i<chars.length;i++) {
      let matching = dict[chars[i]]
      let namechar = c.name.substr(i, 1)
      if (!matching.includes(namechar)) {
        return false
      }
    }
    return true
  })
  let matchingPhones = contacts.filter(c => {
    return c.phone.startsWith(num)
  })
  console.log(matchingContacts.concat(matchingPhones))
}
findT9("728")
findT9("523") // skip 0
findT9("273")
findT9("2738")