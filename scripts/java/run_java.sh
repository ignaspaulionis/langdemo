#!/bin/bash

# Navigate to the Java code directory
cd /app/code/java

# Create an output directory for compiled files
mkdir -p out

# Compile the Java file to the output directory
javac -d out -cp /usr/local/lib/mysql-connector-java.jar HelloWorld.java

# Run the Java program from the output directory
java -cp out:/usr/local/lib/mysql-connector-java.jar HelloWorld
