#!/bin/bash

pass=0
fail=0

run_test() {
    input="$1"
    expected="$2"
    echo -e "$input" | ./reverse_array > tmp.txt
    output=$(cat tmp.txt)
    if [ "$output" == "$expected" ]; then
        echo "✅ PASS: $input -> $expected"
        ((pass++))
    else
        echo "❌ FAIL: $input -> Got '$output', expected '$expected'"
        ((fail++))
    fi
}

run_test "5\n1 2 3 4 5" "5 4 3 2 1"
run_test "1\n42" "42"
run_test "0" ""
run_test "3\n0 0 0" "0 0 0"
run_test "4\n-1 0 1 2" "2 1 0 -1"

# Stress test (skip visual check, just validate it runs)
echo "1000" > stress.txt
seq 1 1000 >> stress.txt
./reverse_array < stress.txt > /dev/null && echo "✅ PASS: Large array test" || echo "❌ FAIL: Large array test"

echo "$pass tests passed, $fail tests failed."
exit $fail
