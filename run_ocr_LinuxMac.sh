#!/bin/bash

# Set the path to the virtual environment
VENV_PATH="archery_ocr"
PYTHON_EXEC="$VENV_PATH/bin/python3"  # Use python3 for macOS/Linux

# Check if the Python executable exists
if [ -f "$PYTHON_EXEC" ]; then
    # Run the compiled bytecode file
    "$PYTHON_EXEC" "ocr.cpython-312.pyc" &
else
    echo "Python executable not found."
    exit 1
fi

exit 0