package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
)

func checkUtility(name string) {
	_, err := exec.LookPath(name)
	if err != nil {
		log.Fatalf("ERROR: %s utility not installed. Please install it.", name)
	}
}

func readMetadata(inputFile string) error {
	cmd := exec.Command("gdalinfo", inputFile)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

func main() {
	var inputFile string
	flag.StringVar(&inputFile, "i", "", "Input .tiff file")
	flag.Parse()

	if inputFile == "" {
		fmt.Println("usage: GRD2COG -i input.tiff")
		os.Exit(1)
	}

	checkUtility("gdalinfo")

	err := readMetadata(inputFile)
	if err != nil {
		log.Fatalf("Error reading metadata: %v", err)
	}

	fmt.Println("Metadata read successfully")
}
