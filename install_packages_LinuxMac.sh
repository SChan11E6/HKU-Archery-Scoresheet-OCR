#!/bin/bash

# Set the name of the virtual environment
BASE_DIR="$(dirname "$0")/"
VENV_NAME="archery_ocr"
VENV_PATH="${BASE_DIR}${VENV_NAME}"

# Dynamically find Python executable using the py launcher
PYTHON_EXEC="python3.12"  # You can also use "py" if installed

# Create the virtual environment
if [ -d "$VENV_PATH" ]; then
    echo "Virtual environment already exists at $VENV_PATH."
else
    echo "Creating virtual environment..."
    "$PYTHON_EXEC" -m venv "$VENV_PATH"
    
    # Check if the virtual environment was created successfully
    if [ $? -ne 0 ]; then
        echo "Failed to create virtual environment."
        exit 1
    else
        echo "Virtual environment created successfully."
    fi
fi

# Activate the virtual environment
source "$VENV_PATH/bin/activate"

# Run the compiled bytecode file directly
PYTHON_EXEC="$VENV_PATH/bin/python"
if [ -f "$PYTHON_EXEC" ]; then
    # Run the compiled bytecode file
    python "$BASE_DIR/install_packages_bat.cpython-312.pyc"
else
    echo "Python executable not found."
    exit 1
fi

echo "Installation complete."