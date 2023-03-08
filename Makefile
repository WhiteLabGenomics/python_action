# Environment variables in make.env file
include make.env
export

# Convert the code to black format
format_code :
	$(PYTHON) black --line-length $(MAX_LINE_LENGTH) .

# Do all the static tests
test_static_all: format_code
	$(PYTHON) black --check --line-length $(MAX_LINE_LENGTH)  .
	$(PYTHON) isort --profile black .
	$(PYTHON) mypy . --ignore-missing-imports
	$(PYTHON) flake8 --exclude=tests --max-line-length $(MAX_LINE_LENGTH) .

test_coverage:
	${LINTAGE_DIR}/coverage.sh

test_complexity:
	${LINTAGE_DIR}/complexity.sh

test_documentation:
	${LINTAGE_DIR}/documentation.sh

run_tests:
	${LINTAGE_DIR}/run_tests.sh

all_tests: test_static_all test_complexity test_documentation test_coverage run_tests 
