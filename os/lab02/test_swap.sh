#!/bin/bash

pass=0
fail=0

run_test() {
    input="$1"
    expected="$2"
    echo "$input" | ./swap > tmp.txt
    output=$(cat tmp.txt)
    if [ "$output" == "$expected" ]; then
        echo "✅ PASS: $input -> $expected"
        ((pass++))
    else
        echo "❌ FAIL: $input -> Got '$output', expected '$expected'"
        ((fail++))
    fi
}

run_test "10 20" "20 10"
run_test "0 0" "0 0"
run_test "-5 7" "7 -5"
run_test "99999 -99999" "-99999 99999"
run_test "5 5" "5 5"

echo "$pass tests passed, $fail tests failed."
exit $fail
