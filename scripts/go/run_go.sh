#!/bin/bash

# Navigate to the Go project directory
cd /app/code/go/

rm hello.go.out 

go mod init mymodule

# Install any necessary Go dependencies
go mod tidy

# Build the Go application
go build -o hello.go.out

# Run the Go application
./hello.go.out
