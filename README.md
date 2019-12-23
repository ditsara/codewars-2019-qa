CodeWars 2019 Quiz Questions and Answers
========================================

This repo contains the quiz questions and answers from CodeWars Bangkok 2019.

Questions
---------

Each question is located in `questions/` as a markdown file. All required
data, scripts, or binaries for a question are in a subdirectory
(ie, `questions/artist.md` -> `questions/artist/`).

Some questions have been modified to (1) include common clarifications asked
during the CodeWars event and (2) refer to filenames rather than URLs.

The tree-search generation Ruby script (which was used for the qualifying
question) requires ActiveSupport to run.

The binaries for the "artist" question are written in Go, and can be
re-built with the `build.rb` script (requires Ruby). Alternatively, you
can compile each binary separately with:

`GOOS=<os> GOARCH=<platform> go build -o bin/artist-<os>-<platform> .`

For example:

`GOOS=linux GOARCH=amd64 go build -o bin/artist-linux-amd64 .`


Answers
-------

Answers are located in the `answers/answers-rb` and `answers/answers-js`
subdirectories. Some Ruby answers require ActiveSupport to run.


