# PyBox

A sandbox for safely running Python code in isolated environments.

## Features

- Code analysis for detecting dependencies
- Dependency management for automatic installation
- Python sandbox for running code in the current environment
- Docker sandbox for running code in isolated containers
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

## License

MIT
