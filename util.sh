ms2HR() {
    local _ms=$1
    local _hrs=$2
    milliseconds=$(($_ms % 1000))
    seconds=$(($_ms / 1000 % 60))
    minutes=$(($_ms / 1000 / 60 % 60))
    hours=$(($_ms / 1000 / 60 / 60 % 24))
    days=$(($_ms / 1000 / 60 / 60 / 24))

    _hrs=""
    if [[ $days != 0 ]]; then
	_hrs+="$days"
	_hrs+="d"
	echo $_hrs
    fi
    if [[ $hours != 0 ]]; then
	if [[ $days != 0 ]]; then
	    _hrs+=":"
	fi
	_hrs+="$hours"
	_hrs+="h"
    fi
    if [[ $minutes != 0 ]]; then
	if [[ $hours != 0 ]]; then
	    _hrs+=":"
	fi
	_hrs+="$minutes"
	_hrs+="m"
    fi
    if [[ $seconds != 0 ]]; then
	if [[ $minutes != 0 ]]; then
	    _hrs+=":"
	fi
	_hrs+="$seconds"
	_hrs+="s"
    fi
    if [[ $milliseconds != 0 ]]; then
	if [[ $seconds != 0 ]]; then
	    _hrs+=":"
	fi
	_hrs+="$milliseconds"
	_hrs+="ms"
    fi
    elapsed_time=$_hrs
}
