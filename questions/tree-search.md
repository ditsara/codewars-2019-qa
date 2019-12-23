Tree Search
===========

- Choose a username that will be unique.
- Generate your data with the script `ruby tree.rb gen <username>`

The JSON data is a tree structure with the format:

```
{
  "name": "some words",
  "score": 5,
  "children": [ <more nodes> ]
}
```

Find the path through the tree with the highest score and return the
corresponding sentence.

Example:

```
{
  "name": "green",
  "score": 1,
  "children": [
    {
      "name": "house",
      "score": 1,
      "children": []
    },
    {
      "name": "martian",
      "score": 5,
      "children": []
    },
    {
      "name": "som tum",
      "score": 3,
      "children": []
    }
  ]
}
```

The highest scoring sentence in this case would be "green martian"
(1 + 5 == 6).

Check your answer by running the script: `ruby tree.rb ans <username>`.
There may be more than one correct answer for a given username's tree.
