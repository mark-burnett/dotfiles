function source_if_dir {
    DIR="$1"
    if [ -d "$DIR" ]; then
        local SH_FILE
        for SH_FILE in $(ls ${DIR}/*.sh | sort); do
            source $SH_FILE
        done
    fi
}

source_if_dir $HOME/.bash.d
