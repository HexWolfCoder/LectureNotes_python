#!/bin/bash

echo "path:$1"

#echo `java -jar ./plantuml-mit-1.2025.10.jar $1`
echo -e `java -jar ./plantuml-mit-1.2026.8.jar -tlatex:nopreamble $1`
echo 'end of script!'
