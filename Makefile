# Makefile for PyBox

.PHONY: all setup clean test lint format run help venv docker-test docker-build docker-clean

# Default values
PORT ?= 8000
HOST ?= 0.0.0.0

# Default target
all: help

# Create virtual environment if it doesn't exist
venv:
	@test -d venv || python3 -m venv venv

# Setup project
setup: venv
	@echo "Setting up PyBox..."
	@. venv/bin/activate && pip install -e .

# Clean project
clean:
	@echo "Cleaning PyBox..."
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type d -name *.egg-info -exec rm -rf {} +
	find . -type d -name .pytest_cache -exec rm -rf {} +

# Run tests
test: setup
	@echo "Testing PyBox..."
	@. venv/bin/activate && python -m unittest discover

# Lint code
lint: setup
	@echo "Linting PyBox..."
	@. venv/bin/activate && flake8 pybox

# Format code
format: setup
	@echo "Formatting PyBox..."
	@. venv/bin/activate && black pybox

# Run the API server
run: setup
	@echo "Running PyBox API server on default port $(PORT)..."
	@. venv/bin/activate && python -m pybox.api --port $(PORT) --host $(HOST)

# Run with custom port (for backward compatibility)
run-port: setup
	@echo "Running PyBox API server on port $(PORT)..."
	@. venv/bin/activate && python -m pybox.api --port $(PORT) --host $(HOST)

# Docker testing targets
docker-build:
	@echo "Building Docker test images..."
	@./run_docker_tests.sh --build

docker-test: docker-build
	@echo "Running tests in Docker..."
	@./run_docker_tests.sh --run-tests

docker-interactive: docker-build
	@echo "Starting interactive Docker test environment..."
	@./run_docker_tests.sh --interactive

docker-mock: docker-build
	@echo "Starting PyBox mock service in Docker..."
	@./run_docker_tests.sh --mock-service

docker-clean:
	@echo "Cleaning Docker test environment..."
	@./run_docker_tests.sh --clean

# Help
help:
	@echo "PyBox Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  setup     - Set up the project"
	@echo "  clean     - Clean the project"
	@echo "  test      - Run tests"
	@echo "  lint      - Lint the code"
	@echo "  format    - Format the code with black"
	@echo "  run       - Run the API server"
	@echo "  run-port PORT=8000 - Run the API server on a custom port"
	@echo "  docker-build      - Build Docker test images"
	@echo "  docker-test       - Run tests in Docker"
	@echo "  docker-interactive - Start interactive Docker test environment"
	@echo "  docker-mock       - Start PyBox mock service in Docker"
	@echo "  docker-clean      - Clean Docker test environment"
	@echo "  help      - Show this help message"
