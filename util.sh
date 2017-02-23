ms2HR() {
    local _ms=$1
    local _hrs=$2
    milliseconds=$(($_ms % 1000))
    seconds=$(($_ms / 1000 % 60))
    minutes=$(($_ms / 1000 / 60 % 60))
    hours=$(($_ms / 1000 / 60 / 60 % 24))
    days=$(($_ms / 1000 / 60 / 60 / 24))

    _hrs=""
    flag=false
    if [[ $days != 0 ]]; then
	_hrs+="$days"
	_hrs+="d"
	flag=true
    fi
    if [[ $hours != 0 ]]; then
	if $flag; then
	    _hrs+=":"
	fi
	_hrs+="$hours"
	_hrs+="h"
	flag=true
    fi
    if [[ $minutes != 0 ]]; then
	if $flag; then
	    _hrs+=":"
	fi
	_hrs+="$minutes"
	_hrs+="m"
	flag=true
    fi
    if [[ $seconds != 0 ]]; then
	if $flag; then
	    _hrs+=":"
	fi
	_hrs+="$seconds"
	_hrs+="s"
	flag=true
    fi
    if [[ $milliseconds != 0 ]]; then
	if $flag; then
	    _hrs+=":"
	fi
	_hrs+="$milliseconds"
	_hrs+="ms"
	flag=true
    fi
    elapsed_time=$_hrs
}
