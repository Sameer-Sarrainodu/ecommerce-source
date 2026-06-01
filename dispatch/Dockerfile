# --- Stage 1: Build the application ---
# Explicitly matching your go.mod toolchain requirement
FROM golang:1.26.3-alpine AS builder

WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the fixed main.go source code
COPY . .

# Build the statically linked binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o dispatch main.go

# --- Stage 2: Final lightweight runtime ---
FROM alpine:3.19

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /app/dispatch .
USER appuser

CMD ["./dispatch"]