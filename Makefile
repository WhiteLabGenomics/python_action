# Path to check the code
export PATH_TO_CODE=src
# Path to the unit tests
export PATH_TO_UNIT_TESTS=tests/unit

# Score thresholds
export COVERAGE_SCORE=50
export COMPLEXITY_SCORE=2
export DOCUMENTATION_SCORE=5

# Max line length for black
MAX_LINE_LENGTH=99

export PYTHON=python -m

# Path to the lintage directory
LINTAGE_DIR=scripts/lintage

# Convert the code to black format
format_code :
	$(PYTHON) black --line-length $(MAX_LINE_LENGTH) .

# Do all the static tests
test_static_all: format_code
	$(PYTHON) black --check --line-length $(MAX_LINE_LENGTH)  .
	$(PYTHON) isort --profile black .
	$(PYTHON) mypy . --ignore-missing-imports
	$(PYTHON) flake8 --exclude=tests --max-line-length $(MAX_LINE_LENGTH) .

test_unit_coverage:
	${LINTAGE_DIR}/coverage.sh

test_complexity:
	${LINTAGE_DIR}/complexity.sh

test_documentation:
	${LINTAGE_DIR}/documentation.sh

run_tests:
	${LINTAGE_DIR}/run_tests.sh

all_tests: test_static_all test_complexity test_documentation test_unit_coverage test_run_tests 
