package main

import (
	"fmt"
	"os"
)

const MAXW = 40
const MAXH = 20

// lraudm
func main() {
	var canvas [MAXH][MAXW]int
	pen := ArtistPen{0, 0, DirUp, PenUp}
	prgm := os.Args[1]
	for _, cmd := range prgm {
		switch string(cmd) {
		case "l":
			pen.TurnLeft()
		case "r":
			pen.TurnRight()
		case "a":
			pen.TurnAround()
		case "u":
			pen.PenUp()
		case "d":
			pen.PenDown()
		case "m":
			pen.Move()
		}
		if pen.penState == PenDown {
			canvas[pen.Y][pen.X] = 1
		}
	}

	for _, y := range canvas {
		for _, x := range y {
			if x == 1 {
				fmt.Print("x")
			} else {
				fmt.Print(" ")
			}
		}
		fmt.Print("\n")
	}
	fmt.Print("\n")
}

type ArtistPen struct {
	X         int
	Y         int
	direction Direction
	penState  PenState
}

type Direction int

const (
	DirUp    Direction = 0
	DirDown  Direction = 1
	DirLeft  Direction = 2
	DirRight Direction = 3
)

type PenState int

const (
	PenUp   PenState = 0
	PenDown PenState = 1
)

func (p *ArtistPen) TurnRight() {
	switch p.direction {
	case DirUp:
		p.direction = DirRight
	case DirDown:
		p.direction = DirLeft
	case DirLeft:
		p.direction = DirUp
	case DirRight:
		p.direction = DirDown
	}
}

func (p *ArtistPen) TurnLeft() {
	switch p.direction {
	case DirUp:
		p.direction = DirLeft
	case DirDown:
		p.direction = DirRight
	case DirLeft:
		p.direction = DirDown
	case DirRight:
		p.direction = DirUp
	}
}

func (p *ArtistPen) TurnAround() {
	switch p.direction {
	case DirUp:
		p.direction = DirDown
	case DirDown:
		p.direction = DirUp
	case DirLeft:
		p.direction = DirRight
	case DirRight:
		p.direction = DirLeft
	}
}

func (p *ArtistPen) PenUp() {
	p.penState = PenUp
}

func (p *ArtistPen) PenDown() {
	p.penState = PenDown
}

func (p *ArtistPen) Move() {
	switch p.direction {
	case DirUp:
		newPos := p.Y - 1
		if newPos >= 0 {
			p.Y = newPos
		}
	case DirDown:
		newPos := p.Y + 1
		if newPos < MAXH {
			p.Y = newPos
		}
	case DirLeft:
		newPos := p.X - 1
		if newPos >= 0 {
			p.X = newPos
		}
	case DirRight:
		newPos := p.X + 1
		if newPos < MAXW {
			p.X = newPos
		}
	}
}
