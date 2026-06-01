FROM golang:1.24 AS build

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -o dispatch main.go

FROM alpine:3.22

WORKDIR /app

COPY --from=build /app/dispatch .

CMD ["./dispatch"]