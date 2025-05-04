#!/bin/bash

total_fail=0

echo "=== Running test_swap.sh ==="
bash test_swap.sh
total_fail=$((total_fail + $?))
echo

echo "=== Running test_reverse_array.sh ==="
bash test_reverse_array.sh
total_fail=$((total_fail + $?))
echo

echo "=== Running test_transpose_matrix.sh ==="
bash test_transpose_matrix.sh
total_fail=$((total_fail + $?))
echo

echo "=== Running test_reverse_list.sh ==="
bash test_reverse_list.sh
total_fail=$((total_fail + $?))
echo

if [ $total_fail -eq 0 ]; then
  echo "🎉 All tests passed for all programs!"
else
  echo "❌ Some tests failed. Total failing scripts: $total_fail"
fi

exit $total_fail
