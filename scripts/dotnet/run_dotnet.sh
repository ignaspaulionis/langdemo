#!/bin/bash

# Navigate to the dotnet project directory
cd /app/code/dotnet/HelloWorld

# Restore the dependencies (if necessary)
dotnet restore

# Build the .NET application
dotnet build

# Run the .NET application
dotnet run
