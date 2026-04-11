#!/bin/bash

echo "Running custom script..."

docker --version
java -version
mvn -version
gradle -version
ansible --version

echo "Setup completed!"