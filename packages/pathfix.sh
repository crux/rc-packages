function pathfix {
    script=${RC_PACKAGES}/../scripts/pathfix.rb
    new_path=$(${script} $*)
    if [ "$?" == 0 ]; then 
        PATH=${new_path}
        export PATH
    fi
    echo "PATH: $PATH"
}
