package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

const (
	N int = iota
	E
	S
	W
)

type Point struct {
	x, y int
}

type Guard struct {
	direction int
}

func readLines(path string) ([]string, error) {
	file, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	return lines, scanner.Err()
}

func process(lines []string) {

}

func main() {
	lines, err := readLines("sample.txt")
	if err != nil {
		log.Fatal(err)
	}

	for _, l := range lines {
		fmt.Println(l)
	}
}
