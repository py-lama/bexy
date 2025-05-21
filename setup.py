from setuptools import setup, find_packages

setup(
    name="pybox",
    version="0.1.0",
    description="A sandbox for safely running Python code",
    author="PyLama Team",
    packages=find_packages(),
    install_requires=[
        "docker",
    ],
    extras_require={
        'dev': [
            'pytest',
            'pytest-cov',
            'tox',
            'flake8',
            'black',
        ],
    },
    python_requires='>=3.6',
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
