function source_if_file () {
    [[ -f "$1" ]] && source "$1"
}

function source_first_file() {
    for file in "$@"; do
        if [ -f "$file" ]; then
            source "$file"
            break
        fi
    done
}

function push_path() {
    if [ -d $1 ]; then
        PATH=$1:$PATH
    fi
}

function push_path_right() {
    if [ -d $1 ]; then
        PATH=$PATH:$1
    fi
}
