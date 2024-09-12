#!/bin/sh
set -e

# Run the Go script with the provided arguments
exec go run GRD2COG.go "$@"