#!/usr/bin/env bash

function installMacOS() {
  JETBRAINS_FOLDER="/Users/$USER/Library/Application Support/JetBrains"
  PHPSTORM_FOLDER=$(ls "$JETBRAINS_FOLDER" | grep PhpStorm | sort | tail -n1)
  XML_FILES=$(ls "live-templates" | grep ".xml")

  while IFS= read -r XML_FILE
  do
    sed "s+_GROOVY_PATH_+$PWD+g" "live-templates/$XML_FILE" > "$JETBRAINS_FOLDER/$PHPSTORM_FOLDER/templates/$XML_FILE"
  done <<< "$XML_FILES"
}

function installLinux() {
  JETBRAINS_FOLDER="/home/$USER/.config/JetBrains"
  PHPSTORM_FOLDER=$(ls "$JETBRAINS_FOLDER" | grep PhpStorm | sort | tail -n1)
  XML_FILES=$(ls "live-templates" | grep ".xml")

  while IFS= read -r XML_FILE
  do
    sed "s+_GROOVY_PATH_+$PWD+g" "live-templates/$XML_FILE" > "$JETBRAINS_FOLDER/$PHPSTORM_FOLDER/templates/$XML_FILE"
  done <<< "$XML_FILES"
}

OS=$(uname -s)

if [[ $OS == "Darwin" ]]; then
  installMacOS
elif [[ $OS == "Linux" ]]; then
  installLinux
fi
