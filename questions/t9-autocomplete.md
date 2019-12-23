T9 Autocomplete
===============

The file contacts.txt (t9-autocomplete/contacts.txt)
has names and phone numbers.

The format is:

```
<name>                 <phone>
^-- column 1           ^-- column 24
```

Your program should receive a sequence of numbers and return the possible
contacts that it could match on a phone keypad.

The letters for T9 autocomplete are:

```
[[2, "ABC"],
 [3, "DEF"],
 [4, "GHI"],
 [5, "JKL"],
 [6, "MNO"],
 [7, "PQRS"],
 [8, "TUV"],
 [9, "WXYZ"]]
```

For simplicity:
- Ignore 1's and 0's
- Assume that matches always start at the beginning of the name

Examples:

- "32" would match "Da" in the name "Dan"
  (3 - "Def", 2 - "Abc")
- "6288" would match "Matt" in the name "Matthew"
  (6 - "Mno", 2 - "Abc", 8 - "Tuv", 8 - "Tuv")
- "34662" would match "Fiona"
  (3 - "deF", 4 - "ghI", 6 - "mnO", 6 - "mNo", 2 - "Abc")

Output the autocomplete contacts for the following inputs:

- 728
- 5203
- 273
- 2738
