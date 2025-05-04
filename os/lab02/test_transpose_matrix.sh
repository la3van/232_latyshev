#!/bin/bash

pass=0
fail=0

run_test() {
    input="$1"
    expected="$2"
    
    # Run the test and capture the output
    echo -e "$input" | ./transpose_matrix > actual.txt

    # Remove trailing spaces and newlines for comparison
    expected_trimmed=$(echo -e "$expected" | awk '{$1=$1};1') # Trim spaces from expected
    actual_trimmed=$(awk '{$1=$1};1' actual.txt) # Trim spaces from actual output

    if [ "$actual_trimmed" == "$expected_trimmed" ]; then
        echo "✅ PASS: $input"
        ((pass++))
    else
        echo "❌ FAIL: $input"
        echo "Got:"
        cat -A actual.txt
        echo "Expected:"
        echo "$expected_trimmed" | cat -A
        ((fail++))
    fi
}


run_test "2 3\n1 2 3\n4 5 6" "1 4 \n2 5 \n3 6"
run_test "1 1\n7" "7 "
run_test "3 1\n1\n2\n3" "1 2 3 "
run_test "1 3\n1 2 3" "1 \n2 \n3 "
run_test "0 0" ""

echo "$pass tests passed, $fail tests failed."
exit $fail
