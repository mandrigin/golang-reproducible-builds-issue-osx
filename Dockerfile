FROM golang:1.14-alpine

RUN apk add --no-cache make gcc musl-dev linux-headers git

WORKDIR /app

# next 2 lines helping utilize docker cache
COPY go.mod go.sum ./
RUN go mod download

ADD . .
RUN sh ./build-n-diff.sh
