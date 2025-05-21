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



## Overview
PyBox is a sandbox system for safely running Python code from scripts or markdown, with support for dependency management and Docker isolation.

---

## Mermaid Diagram – Main Flow

```mermaid
flowchart TD
    A[User Input: .py/.md file] --> B{File Type?}
    B -- .py --> C[Read Python file]
    B -- .md --> D[Extract python code blocks]
    C --> E[Choose Sandbox Type]
    D --> E
    E -- PythonSandbox --> F[Run code locally]
    E -- DockerSandbox --> G[Run code in Docker]
    F --> H[Collect Results]
    G --> H
    H --> I[Display Output]
```

---

## ASCII Diagram – Component Overview

```
+-------------------+
|    User/CLI/Menu  |
+--------+----------+
         |
         v
+--------+----------+
| pybox_run / menu   |
+--------+----------+
         |
         v
+-------------------+
| File Handler      |
| (.py/.md parser)  |
+--------+----------+
         |
         v
+-------------------+
|  Sandbox Layer    |
| PythonSandbox     |
| DockerSandbox     |
+--------+----------+
         |
         v
+-------------------+
|  Output/Reporter  |
+-------------------+
```

---

## Flow Description
1. **User** selects file via CLI or menu.
2. **File Handler** detects file type:
   - `.py`: reads the script.
   - `.md`: extracts all ```python code blocks.
3. **Sandbox Layer** runs code using `PythonSandbox` (local) or `DockerSandbox` (container).
4. **Output/Reporter** collects and displays results for each code block/script.

---

## Example Sequence (Markdown)

```mermaid
sequenceDiagram
    participant U as User
    participant P as pybox_run
    participant F as FileHandler
    participant S as Sandbox
    participant O as Output
    U->>P: Provide README.md
    P->>F: Parse .md, extract python blocks
    F->>S: Send code block to sandbox
    S->>O: Return execution result
    O->>U: Show output
    loop for each block
        F->>S: Next block
        S->>O: Result
        O->>U: Output
    end
```
```

---

## Key Components
- **pybox_run**: CLI/utility for running code from files
- **examples.py**: Interactive menu, now integrates file execution
- **PythonSandbox/DockerSandbox**: Safe code execution layers
- **DependencyManager**: Handles required packages
- **Markdown Parser**: Extracts code blocks from `.md`

---

## Extending
- Add support for more file types (e.g., Jupyter).
- Enhance reporting (HTML, JSON output).
- Add block selection for markdown.

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
