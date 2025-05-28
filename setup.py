from setuptools import setup, find_packages

setup(
    name="bexy",
    version="0.1.17",
    description="A sandbox for safely running Python code",
    author="Tom Sapletta",
    packages=find_packages(),
    install_requires=[
        "docker",
        "questionary",
    ],
    extras_require={
        'dev': [
            'pytest',
            'pytest-cov',
            'tox',
            'flake8',
            'black',
            'twine',
            'build',
            'wheel'
        ],
    },
    python_requires='>=3.6',
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ],
    entry_points={
        'console_scripts': [
            'bexy=bexy.examples:main',
        ],
    },
)
