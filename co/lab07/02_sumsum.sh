sum() {
    total=0
    for arg in "$@"; do
        num=$(expr "$arg" + 0 2>/dev/null)
        if [ $? -ne 0 ]; then
            echo 0
            return
        fi
        total=$(expr "$total" + "$arg" 2>/dev/null)
    done
    echo "$total"
}

read line1
read line2

set -- $line1
sum1=$(sum "$@")

set -- $line2
sum2=$(sum "$@")

if [ "$sum1" -eq "$sum2" ]; then
    echo "Equal"
else
    echo "Not equal"
fi

