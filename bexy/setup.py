from setuptools import setup, find_packages

setup(
    name="bexy",
    version="0.1.0",
    description="A sandbox for safely running Python code",
    author="Tom Sapletta",
    packages=find_packages(),
    install_requires=[
        "docker",
    ],
    python_requires='>=3.6',
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
