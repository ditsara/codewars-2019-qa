Artist
======

The objective of this question is to write a program that outputs the
commands for a bot to draw the given ASCII picture.

Download the appropriate binary file provided for your architecture:

- Modern Mac OS    --  artist/bin/artist-darwin-amd64
- Modern Windows   --  artist/bin/artist-windows-amd64
- Modern Linux     --  artist/bin/artist-linux-amd64
- Chrome OS / ARM  --  artist/bin/artist-linux-arm
- Very Old Mac OS  --  artist/bin/artist-windows-386
- Very Old Windows --  artist/bin/artist-darwin-386
- Very Old Linux   --  artist/bin/artist-linux-386

Download this ASCII picture: artist/picture.txt

This program creates an ASCII picture by moving a printing robot.
Here are the robot's commands:

- `r` -- turn right 90 deg
- `l` -- turn left 90 deg
- `a` -- turn around
- `u` -- pen up
- `d` -- pen down
- `m` -- move forward

Your canvas is 40 characters wide and 20 characters tall.
Your robot starts in the upper left of the canvas, facing up, with its pen up.
If you put your pen down, you'll immediately print on your current square.
If you move with the pen down, you'll print on any squares you move to.

Run the program on your command line with one argument containing all your
robot commands in order.

Example 1:

```
artist-linux-amd64 rdmmm
```

Produces the following output (blank areas left out):

```
xxxx
   x
```


Example 2:

```
artist-linux-amd64 rmmadmmlmmmlmmmmmmmmlmmmlmm
```

Produces the following output (blank areas left out):

```
xxx   xxx
x       x
x       x
xxxxxxxxx
```

Produce an exact copy of picture.txt.
