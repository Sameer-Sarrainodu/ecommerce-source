# --- Stage 1: Build the application ---
# Changed from 1.22 or 1.24 to 1.26-alpine
FROM golang:1.26-alpine AS builder

# Set the current working directory inside the container
WORKDIR /app

# Copy go mod and sum files to cache dependencies
COPY go.mod go.sum ./

# Download all dependencies (Go modules)
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o dispatch main.go

# --- Stage 2: Final lightweight runtime ---
FROM alpine:3.19

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /app/dispatch .
USER appuser

CMD ["./dispatch"]