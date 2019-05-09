#!/bin/bash

# Run in go using - 
# <exec command="bash">
#   <arg>-c</arg>
#   <arg>curl -s https://gist.githubusercontent.com/ketan/2866a236596636311d64/raw/ansi-color-test.sh | bash</arg>
# </exec>


bash <( curl -s https://raw.githubusercontent.com/fidian/ansi/master/ansi)
#8 bit color table (256 colors)
#for i in 16 52 88 124 160 196 232; do
for i in {0..6}; do
    let "i = i*36 +16"
    for j in {0..35}; do
        let "val = i+j"
    done
done

# something else

T='gYw'   # The test text
echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";
for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do echo -en "$EINS \033[$FG\033[$BG  $T \033[0m\033[$BG \033[0m";
    done
    echo;
done
echo

