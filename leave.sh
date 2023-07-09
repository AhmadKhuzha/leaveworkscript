#!/bin/bash

hdate () {
  awk -v date="$(date +%s -d "$1")" -v now="$(date +%s)" '
    BEGIN {  diff = now - date;
       if (diff > (24*60*60)) printf "%.0f days", diff/(24*60*60);
       else if (diff > (60*60)) printf "%.0f hours", diff/(60*60);
       else if (diff > 60) printf "%.0f minutes", diff/60;
       else printf "%s seconds", diff;
    }'
}


function relative() {
    local last_unix="$(date --date="$1" +%s)"    # convert date to unix timestamp
    local now_unix="$(date +'%s')"

    local delta=$(($last_unix - $now_unix))

    if (( $delta < 0 ))
    then
	echo "now, bitch."
	return
    elif (( $delta < 60 )) 
    then
        echo "in "$delta" seconds"
        return 
    elif (( $delta < 3600))  # 45 * 60
    then
	    echo "in "$(( $delta / 60 ))" minute(s)"
	return
    else 
	echo "in "$(( $delta / 3600 ))" hours";
    fi
}



coming_time=$(who -b | awk '{print $3" "$4}')

leaving_time=$(date -d "$coming_time 450 minutes" +'%Y-%m-%d %I:%M %p')

ct_time=$(date -d "$coming_time" +'%Y-%m-%d %I:%M %p')

tleft=$(relative "$leaving_time")

echo "I started this laptop at $ct_time, I can leave at $leaving_time. Which is $tleft."
#echo "$leaving_time"
