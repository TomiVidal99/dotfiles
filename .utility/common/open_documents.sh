#!/bin/bash
# Launches a menu to select a document to be opened
# Dependencies: rofi, fd and okular

DOCUMENTS_DIRECTORIES=~/.utility/common/documents_directories
DOCUMENT_READER=okular

# sets the folder icon by applying an echo pattern
function apply_folder_pattern() {
  xargs -I '{}' echo -en "{}\0icon\x1ffolder\n"
}

function rofi_command() {
  apply_folder_pattern | rofi -dmenu -i -markup-rows -p "Seleccione un documento"
}

# returns the basename of the file
function parse_filepath {
  xargs -I '{}' basename -s .pdf {}
}

DOCUMENTS=$(cat $DOCUMENTS_DIRECTORIES | xargs -I '{}' fd .pdf {})
SELECTED_DOCUMENT_NAME=$(echo "$DOCUMENTS" | parse_filepath | rofi_command)
SELECTED_DOCUMENT_PATH=$(echo "$DOCUMENTS" | grep "$SELECTED_DOCUMENT_NAME")

if [[ "$SELECTED_DOCUMENT_NAME" = "" || "$SELECTED_DOCUMENT_PATH" = "" ]]; then
  #rofi -e "You didn't select a directory!\nDir name: ${SELECTED_DIRECTORY_NAME}\nDir path:${SELECTED_DIRECTORY}"
  exit
fi

$DOCUMENT_READER "$SELECTED_DOCUMENT_PATH" & disown
