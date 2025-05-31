# Project Setup

This project uses Python 3 with direnv for environment management.

## Prerequisites

- [direnv](https://direnv.net/) - For managing project-specific environment variables
- Python 3.x

## Setup Instructions

Add the following to your `.envrc` file:

```bash
layout python3
```

Then run `direnv allow` to allow direnv to manage the python virtual environment.

## Installing Dependencies

After setting up direnv, install the project dependencies:

```bash
pip install -r requirements.txt
```

This will install all required packages, including deepeval.
