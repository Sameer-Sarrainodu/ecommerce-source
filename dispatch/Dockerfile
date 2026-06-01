# --- Stage 1: Build the application ---
FROM golang:1.22-alpine AS builder

# Set the current working directory inside the container
WORKDIR /app

# Copy go mod and sum files to cache dependencies
COPY go.mod go.sum ./

# Download all dependencies (Go modules)
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the Go app statically linked for a Linux container
RUN CGO_ENABLED=0 GOOS=linux go build -o dispatch .

# --- Stage 2: Final lightweight runtime ---
FROM alpine:3.19

# Add a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy the pre-built binary from the builder stage
COPY --from=builder /app/dispatch .

# Use the non-root user to run the application
USER appuser

# Command to run the executable
CMD ["./dispatch"]