# Python workflows in github action

Repo that contains the different steps to test and creating github actions for python code.
The aim is to be a reference to the python developers of [WhiteLabGenomics](https://github.com/WhiteLabGenomics/).

## Use this repository

There are two main ways to use the code contained in this repository for your work.

1. Using the repository as a template and creating your project on the top of this repository.
2. Using the workflows built here as in [this example](https://github.com/orgs/community/discussions/25607).

If you have any questions, feel free to create a discussion, or open an issue on GitHub.
Do not hesitate to tag the author(s) to solicit an action.

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

To start a new project, you can use this template and then install requirements as follows:

```bash
pip install -r requirements.txt
```

It will install the dependencies from the `requirements.txt`.

## Makefile

The `Makefile` is an important file that summarises the needed code. One can choose not to use it, but for this repository the different tests use `Makefile`.

There are variables the makefile uses, these are collected into an environment file called `make.env` and are listed in the following:

- `PATH_TO_CODE` : the path where the main code is. Usually the `src` directory.
- `PATH_TO_UNIT_TEST` : the path to the folder with the unit tests. Usually the `tests` directory.
- `COVERAGE_SCORE`: the acceptable score for the coverage (how large is our unit tests for the main code). It has to be updated for every project.
- `COMPLEXITY_SCORE` : the acceptable score for the complexity of the code. It has to be updated for every project.
- `DOCUMENTATION_SCORE`: the acceptable score for the documentation. This is a score out of 10. It has to be updated for every project.
- `MAX_LINE_LENGTH` : the maximum number of length per line for the `black` formatter. Also contained in `pyproject.toml` file.
- `PYTHON` : which python version to use. By default, it will use the one memorised in the dockerfile. If you have setup a virtual env, you can change this variable in there.
- `LINTAGE_DIR`: the directory to the different lintage code.

Here are the different targets used in the `Makefile` :

- `format_code` : format the source code in the `black` format.
- `test_static_all`: do static tests that don't require further implementation to convert it to errors. It uses `black`, `isort`, `mypy` and `flake8`.
- `test_coverage`: run the `coverage.sh` script to calculate the unit tests coverage score.
- `test_complexity`: run the `complexity.sh` script to accept the code if it is not too complex.
- `test_documentation`: run the `documentation.sh` script to accept the code if it is enough documented.
- `run_tests`: run the `run_tests.sh` script to run the unit tests on the code.
- `all_tests`: run all the tests above. It is useful to use in local to check that the current code is passing the tests.

The different tests can be summarized in the following pipeline :

![test](img/test_pipeline.drawio.png?raw=true "Test pipeline")

## Github actions

Several actions are set in this repository.

### Test

The actions to run automatically the tests are in the file [`.github/workflows/test.yml`](https://github.com/WhiteLabGenomics/python_action/blob/main/.github/workflows/test.yml).

This action is configured to be ran at every push on every branch.

### Build

There is a workflow called `build` that builds the docker image sends some messages to a specific Slack channel. This is triggered by a pull request on the main or develop branches of the repository.

To enable the notification with Slack, please add to the repository the `secret` of the `SLACK_WEBHOOK_URL`.

Then, it uses the `slack` action in order to get the status of the tests.
After, it loads the code of the github, with the `actions/checkout@v3` action.
Moreover, it runs all the code previously explained : test static, complexity, documentation and unit tests.
Finally, it sends the message to the associated conversation (from the webhook url).

### Deploy

This workflow runs only after the pull request has been merged into the main or develop branch.

It builds the image and deploy it to the specified service.

## Authors

- Clément Bernard
- [Oscar de Felice](https://github.com/oscar-defelice)
