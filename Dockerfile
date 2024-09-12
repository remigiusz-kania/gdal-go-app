
FROM ghcr.io/osgeo/gdal:ubuntu-full-latest

RUN apt-get update && apt-get install -y golang-go


WORKDIR /app


COPY go.mod go.sum ./

RUN go mod download

COPY GRD2COG.go .
COPY entrypoint.sh .

COPY input.tiff . 

ENTRYPOINT ["./entrypoint.sh"]