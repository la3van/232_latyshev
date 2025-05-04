#!/bin/bash

pass=0
fail=0

run_test() {
    input="$1"
    expected="$2"
    echo "$input" | ./reverse_list > tmp.txt
    output=$(cat tmp.txt)
    if [ "$output" == "$expected" ]; then
        echo "✅ PASS: $input"
        ((pass++))
    else
        echo "❌ FAIL: $input -> Got: '$output', Expected: '$expected'"
        ((fail++))
    fi
}

run_test "1 2 3 0" "3 2 1"
run_test "0" ""
run_test "42 0" "42"
run_test "-1 -2 -3 0" "-3 -2 -1"

# Stress test
seq 1000 -1 1 | tr '\n' ' ' | sed 's/$/0/' > stress.txt
cat stress.txt | ./reverse_list > /dev/null && echo "✅ PASS: Large list" || echo "❌ FAIL: Large list"

echo "$pass tests passed, $fail tests failed."
exit $fail
