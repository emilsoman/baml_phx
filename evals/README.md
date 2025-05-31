# Project Setup

This project uses Python 3 with uv for environment management.

## Prerequisites

- [uv](https://docs.astral.sh/uv/) - For managing project-specific environment variables
- Python 3.x

## Setup Instructions

```bash
uv sync
```

## Running Tests

```bash
# Ensure OPENAI_API_KEY is set in the environment
uv run deepeval test run evals
```
