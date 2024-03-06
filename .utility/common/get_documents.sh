#!/bin/zsh

# Gets the documents listed in the 'documents_dir'
# file and lets you (with rofi) open them in your file manager

#alias okular='"/mnt/c/Program Files/Okular/bin/okular.exe"'

DIRECTORIES=~/.dotfiles/.utility/common/documents_directories

# opens rofi with the right flags
rofi_command() {
  rofi -dmenu -i -markup -markup-rows -p "Seleccione un documento"
}

# returns the line parsed with the data
get_options_line() {
  name=$(basename -s pdf "$1")
  printf "<big><b>%s</b></big> - <small><i>%s</i></small>\x00icon\x1fapplication-pdf\n" "$name" "$1"
}

# feeds all the one line options to the line creator
parse_options() {
  #xargs -I '{}' zsh -c 'get_options_line "{}"'
  xargs -I '{}' zsh -c 'get_options_line() { name=$(basename -s pdf "$1"); printf "<big><b>%s</b></big> - <small><i>%s</i></small>\x00icon\x1fapplication-pdf\n" "$name" "$1"; }; get_options_line "{}"'
}

# extracts the path from the given return value
get_path_from_selected_option() {
  sed -E "s/.*<i>//" | sed -E "s/<\/i>.*//"
}

DOCUMENTS=$(cat $DIRECTORIES | xargs -I '{}' fdfind -e pdf . "{}")
SELECTED_DOCUMENT_NAME=$(echo "$DOCUMENTS" | parse_options | rofi_command)
SELECTED_DOCUMENT_PATH=$(echo "$SELECTED_DOCUMENT_NAME" | get_path_from_selected_option)

echo "$SELECTED_DOCUMENT_NAME"
echo "$SELECTED_DOCUMENT_PATH"

if [[ "$SELECTED_DOCUMENT_NAME" = "" || "$SELECTED_DOCUMENT_PATH" = "" ]]; then
  exit
fi

echo "selected document: '$SELECTED_DOCUMENT_PATH'"
okular """$SELECTED_DOCUMENT_PATH""" && disown
