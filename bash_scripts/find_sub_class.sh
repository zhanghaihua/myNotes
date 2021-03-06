#!/bin/sh
if [ $# -eq 1 ];then
    SEARCH_PATH=.
    SEARCH_STR="$1"
elif [ $# -eq 2 ];then
    SEARCH_PATH=$1
    SEARCH_STR="$2"
else
    echo "[Usage] find_cpp [search_path] search_string"
    exit 0
fi

echo "find_src $SEARCH_PATH $SEARCH_STR"

find $SEARCH_PATH -name "*.cpp" -o -name "*.cc" -o -name "*.h" -o -name "*.cxx" -o -name "*.c" | xargs grep -nEi --color=auto "class.*:.*(public|private|protected)\s+.*\<$SEARCH_STR\>.*"
