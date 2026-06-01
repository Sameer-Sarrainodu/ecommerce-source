# --- Stage 1: Build Stage ---
FROM golang:1.24-alpine AS builder

WORKDIR /app

# Copy dependency files first
COPY go.mod go.sum ./
RUN go mod download

# Copy application source code
COPY . .

# Statically compile the binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o dispatch main.go

# --- Stage 2: Runtime Stage ---
FROM alpine:3.19

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app

COPY --from=builder /app/dispatch .
USER appuser

CMD ["./dispatch"]