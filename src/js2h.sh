#!/bin/sh

echo -n '#define HINTS_JS "'
cat $1 | \
    sed -e "s|/\*[^*]*\*\+\([^/][^*]*\*\+\)*/||g" | \
    tr '\n\r\t' ' ' | \
    sed -e "s| \+| |g" \
    -e "s|^//.*$||" \
    -e "s| \([-?<>:=(){};+\&\"',\|]\)|\1|g" \
    -e "s|\([-?<>:=(){};+\&\"',\|]\) |\1|g" \
    -e 's|\\|\\\\|g' \
    -e 's|"|\\"|g'
echo '"'
