# PyBox

A sandbox for safely running Python code in isolated environments.

## Features

- Code analysis for detecting dependencies
- Dependency management for automatic installation
- Python sandbox for running code in the current environment
- Docker sandbox for running code in isolated containers
- Interactive terminal menu for running examples (arrow keys + Enter)
- Utility functions for system information and execution results

## Installation

```bash
pip install pybox
```

## Usage

```python
from pybox import PythonSandbox, DockerSandbox

# Run code in the current Python environment
python_sandbox = PythonSandbox()
result = python_sandbox.run_code("""
import math
print(f'The square root of 16 is {math.sqrt(16)}')
""")
print(result)

# Run code in an isolated Docker container
docker_sandbox = DockerSandbox()
result = docker_sandbox.run_code("""
import platform
print(f'Running on {platform.system()}')
""")
print(result)
```

## Running code from .py and .md files

You can use PyBox to safely run code from Python scripts (`.py`) or extract and run all Python code blocks from Markdown files (`.md`). This functionality is available both as a command-line tool and in the interactive menu.

### Usage (CLI)

```bash
python -m pybox.pybox_run script.py
python -m pybox.pybox_run README.md
python -m pybox.pybox_run README.md --docker
```

- For `.py` files: the whole script is executed in a sandbox.
- For `.md` files: all code blocks marked as ```python are extracted and executed one by one in isolation.
- Add `--docker` to run code in an isolated Docker container.

### Usage (Interactive Menu)

Launch the menu:
```bash
pybox
```
Choose "Uruchom kod z pliku .py lub .md" and follow the prompts to run any script or markdown code blocks, locally or in Docker.

### Example

Suppose you have a Markdown file with:

```markdown
```python
print("Hello from markdown!")
```
```

Running `python -m pybox.pybox_run README.md` or using the interactive menu will execute the code above in a sandbox and print the results.

## Interactive Examples Menu

PyBox provides an interactive terminal menu for running usage examples. The menu allows you to navigate using arrow keys and select examples with Enter. Powered by the [`questionary`](https://github.com/tmbo/questionary) library.

### Running the interactive menu

You can start the interactive menu via the console script or directly:

```bash
# Using the installed entry point
pybox

# Or directly
python -m pybox.examples
```

Follow the on-screen menu to choose an example (e.g. CodeAnalyzer, DependencyManager, PythonSandbox, DockerSandbox, etc.).

### Requirements

The interactive menu requires `questionary` (installed automatically with PyBox 0.1.1+):

```bash
pip install questionary
```

## License

Apache License 2.0
