# Python test for github action

Repo that explains the different test and the conversion into github actions for python code.

## Structure

The structure of the repo is the following :

![test](img/github_code.drawio.png?raw=true "Code overview")

- `.github/workflows` : where the setup of the actions is specified.
- `img`: images for the README. (not useful for other projects)
- `script` : the script of the different tests.
- `src` : the source code of the project. Could change for every project.
- `tests` : the directory where are the different tests.
- `Makefile` : where all the main commands are reported. This is not mandatory.
- `requirements.txt` / `pyproject.toml` : the different requirements for the project.

## Setup

To start a new project, you can copy the directories and then install `poetry` :

```bash
pip install poetry
```

Then, initialise poetry using :

```bash
poetry init
```

Finally, install the requirements using :

```bash
poetry install
```

It will install the dependencies from the `poetry.lock` (or create it if it doesn't exist).
More details on poetry are available on the following link : https://python-poetry.org/.

You can also use other library manager than poetry. If so, please update in the Makefile the `PYTHON` variable (to make the tests run).

## Makefile

The `Makefile` is an important file that summarises the needed code. One can choose not to use it, but for this repository the different tests use `Makefile`.

Here are the important variables in the `Makefile`:

- `PATH_TO_CODE` : the path where the main code is.
- `PATH_TO_UNIT_TEST` : the path to the folder with the unit tests.
- `COVERAGE_SCORE`: the acceptable score for the coverage (how large is our unit tests for the main code). It has to be updated for each project.
- `COMPLEXITY_SCORE` : the acceptable score for the complexity of the code. It has to be updated for each project.
- `DOCUMENTATION_SCORE`: the acceptable score for the documentation. This is a score out of 10. It has to be updated for each project.
- `MAX_LINE_LENGTH` : the maximum number of length per line for the `black` formatter.
- `PYTHON` : which python to use. By default, it will use the `poetry` python. If you have setup a virtual env, you can change this variable for `PYTHON -m`.
- `LINTAGE_DIR`: the directory to the different lintage code.

Here are the different targets used in the `Makefile` :

- `format_code` : format the source code in the `black` format.
- `test_static_all`: do static tests that don't require further implementation to convert it to errors. It uses `black`, `isort`, `mypy` and `flake8`.
- `test_unit_coverage`: run the `coverage.sh` script to convert the unit tests into a coverage score.
- `test_complexity`: run the `complexity.sh` script to accept the code if it is not too complex.
- `test_documentation`: run the `documentation.sh` script to accept the code if it is enough documented.
- `all_tests`: run all the tests. It is useful to use in local to check that the current code is passing the tests.

The different tests can be summarized in the following pipeline :

![test](img/test_pipeline.drawio.png?raw=true "Test pipeline")

## Github actions

The actions to run automatically the tests are in the file [`.github/workflows/test.yml`](https://github.com/WhiteLabGenomics/python_action/blob/main/.github/workflows/test.yml).
To enable the notification with slack, please add to the repository the `secret` of the `SLACK_WEBHOOK_URL`.

Then, it uses the `slack` action in order to get the status of the tests.
After, it loads the code of the github, with the `actions/checkout@v3` action.
Moreover, it runs all the code previously explained : test static, complexity, documentation and unit tests.
Finally, it sends the message to the associated conversation (from the webhook url).

## Authors

- Clément Bernard
- [Oscar de Felice](https://github.com/oscar-defelice)
