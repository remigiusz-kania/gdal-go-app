# Use the GDAL Docker image as the base image
FROM ghcr.io/osgeo/gdal:ubuntu-full-latest

# Install Go
RUN apt-get update && apt-get install -y golang-go

# Set the working directory
WORKDIR /app

# Copy the Go module files
COPY go.mod go.sum ./

# Download Go module dependencies
RUN go mod download

# Copy the Go script and entrypoint script into the container
COPY GRD2COG.go .
COPY entrypoint.sh .

COPY input.tiff . 

# Set the entrypoint
ENTRYPOINT ["./entrypoint.sh"]