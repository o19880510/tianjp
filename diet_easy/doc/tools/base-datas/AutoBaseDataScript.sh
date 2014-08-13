#!/bin/bash

# gedit ./dbconnect.properties
# gedit ./fileList.txt

rm AutoBaseDataScript.log

java -jar "test.jar" fileList.txt > AutoBaseDataScript.log

read -p "press anykey..."
