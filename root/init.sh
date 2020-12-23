#!/bin/sh

set -o pipefail 
set -o errexit 
set -o nounset

_NORMAL=$(printf "\033[0m")
_RED=$(printf "\033[0;31m")
_YELLOW=$(printf "\033[0;33m")
_CYAN=$(printf "\033[0;36m")

_COLOUR=1

_log() {
    local _cmd="$@"
    printf "${_COLOUR:+${_YELLOW}}"
    printf "%s [%s] %-40s\n" "$(date '+%b %d %T')" $name "CMD: $_cmd"
    printf "${_COLOUR:+${_CYAN}}"
    eval "$_cmd" 2>&1 | sed -e 's/^/     | /'
    local _status=$?
    if [ $_status -eq 0 ]
    then
        printf "${_COLOUR:+${_YELLOW}}[OK]\n"
    else
        printf "${_COLOUR:+${_RED}}[ERROR]\n"
    fi
    printf "${_COLOUR:+${_NORMAL}}"
    return $_status
}

_err() {
    echo ERROR: $@ >&1
    exit 1
}

(
    _log hostname
    _log chsh -s /bin/sh root
    _log "uname -a | tee /etc/motd"
    _log "sysrc sshd_enable=YES sshd_flags='-o PermitRootLogin=prohibit-password'"
    _log sysrc check_network_enable=YES
    _log sysrc sendmail_enable=NONE
    _log rm -vf /etc/ssh/*_key /etc/ssh/*_key.pub

) | tee -a /var/log/pot-init.log
