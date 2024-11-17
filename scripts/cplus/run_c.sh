#!/bin/bash

# Set the working directory inside the container
cd /app/code/cplus

# Compile the C++ program
g++ -o hello_cpp hello.cpp -I/usr/include/cppconn -L/usr/lib -lmysqlcppconn

# Run the compiled C++ program
./hello_cpp
