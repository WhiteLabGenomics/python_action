#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

score=$( $PYTHON pylint --disable=all --enable=C0111 ${PATH_TO_CODE} | tail -n2 | head -n1 | cut -f7 -d " " | cut -f1 -d/)
echo "SCORE PYLINT : ${score} | ACCEPTABLE SCORE : ${DOCUMENTATION_SCORE}"
condition=`echo "$score>=$DOCUMENTATION_SCORE" | bc -l`
if [[ $condition == "1" ]]; then
  echo -e "${GREEN}PYLINT SCORE ACCEPTABLE${NC}"
  exit 0
else
  echo -e "${RED}PYLINT SCORE NOT ACCEPTABLE${NC}"
  exit 1
fi