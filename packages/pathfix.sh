function pathfix {
    script=${RC_SCRIPT_DIR}/pathfix.rb
    new_path=$(${script} $*)
    if [ "$?" == 0 ]; then 
        PATH=${new_path}
        export PATH
    fi
    echo "PATH: $PATH"
}
