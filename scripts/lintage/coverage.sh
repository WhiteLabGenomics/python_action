#!/bin/bash

$PYTHON coverage run --source=${PATH_TO_CODE} -m pytest --disable-pytest-warnings ${PATH_TO_UNIT_TESTS}
score=$( $PYTHON coverage report | tail -n1 | sed -E "s/ +/ /g" | cut -f4 -d " " | sed "s/%//")
condition=`echo "$score>=$COVERAGE_SCORE" | bc -l`
echo "COVERAGE UNIT TEST : ${score} | ACCEPTABLE_SCORE : ${COVERAGE_SCORE}"
if [[ $condition == "1" ]]; then
  echo "Coverage Score acceptable: ${COVERAGE_SCORE}";
  exit 0
else
  echo "Coverage score not acceptable : please, implement more tests for your code."
  exit 1
fi
