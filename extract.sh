#!/bin/bash
if [ ! -f $1 ]; then
    echo "File not found."
    exit 1
fi

temp_results="_results"
> "$temp_results"

cat $1 | parallel -j 10 '
    domain={};
    root_line=$(timeout 5 openssl s_client -connect "$domain":443 -servername "$domain" < /dev/null 2>/dev/null | sed -n "/Certificate chain/,/---/p" | grep " i:" | tail -n 1);
    root_ca=$(echo "$root_line" | sed -E "s/.*CN\s*=\s*([^,]*).*/\1/");
    if [ -z "$root_ca" ]; then
      root_ca="Unreachable/Error";
    fi;
    echo "$domain: $root_ca";
    echo "$root_ca" >> '"$temp_results"'
'
sort "$temp_results" | uniq -c | sort -nr
rm "$temp_results"
