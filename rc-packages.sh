#!/bin/bash

# do nothing when not running interactively
[ -z "$PS1" ] && return

# do not run when packages are already loaded
if [ "${RC_PACKAGES}x" != "x" ]; then 
    return
fi

# define base dir for packages and further source commands
RC_PACKAGES=$(basename ${BASH_SOURCE})/packages

# debug echo function
function decho() {
    if [ "x$DECHO" == "xon" ]; then
        echo " @@ $*"
    fi
}
function dechoon() { 
    export DECHO=on
}
function dechooff() { 
    export DECHO=off
}
#dechoon


function rc-package-list() {
    for pkg in ${RC_PACKAGES}; do 
        pkg=(${pkg//[()]/ })
        name=${pkg[0]}
        variants=(${pkg[1]//,/ })
        #echo -e "===== ${name}:\t${variants[@]}"; 
        printf "%12s: %s\n" ${name} "${variants[*]}"
        #lines[${#lines[@]}]=$(printf "%${maxlength}s : %s\n" ${name} "${variants[*]}")
    done;
}

function source-rc-package-script() {
    script=$1
    if [ -f ${script} ]; then
        decho "variant: ${script}"
        source ${script} 
        m="${m}${m:+,}${variant}"
    else
        decho "not found: ${script}"
    fi
}

function rc-package-add() {
    package=$1
    m=""

    decho "base package: ${package}"
    script=${RC_PACKAGES}/${package}.generic.sh
    [ -f ${script} ] && source ${script} && m="${m}${m:+,}generic"
    script=${RC_PACKAGES}/${package}.sh
    [ -f ${script} ] && source ${script} && m="${m}${m:+,}generic"

    hostname=${HOSTNAME/.*/}
    for variant in default ${OSTYPE/10.0/} ${hostname}; do
        # find script either in variant dir...
        script=${RC_PACKAGES}/${variant}/${package}.sh
        if [ -f ${script} ]; then
            decho "variant: ${script}"
            source ${script} && m="${m}${m:+,}${variant}"
        fi
        # ..or with variant in script name
        script=${RC_PACKAGES}/${package}.${variant}.sh
        if [ -f ${script} ]; then
            decho "variant: ${script}"
            source ${script} && m="${m}${m:+,}${variant}"
        fi
    done
    
    if [ ! "$m"x = "x" ]; then
        RC_PACKAGES="${RC_PACKAGES}${RC_PACKAGES:+ }${package}($m)" 
    fi
}

function rc-load-packages() {
    packages=$*
    decho "loading packages: ${packages}"
    for p in $packages; do 
        if [ ${p} == ${p/\#} ]; then
            rc-package-add ${p}
        fi
    done
}

rc-load-packages $(cat ${HOME}/.rc-packages | cut -f 1)

#end.
