#!/bin/bash

# This script installs the CLI app you're making globally on your local machine.
# Assumes you're using Python's Poetry to manage your project.

error_occurred=false

if ! command -v poetry >/dev/null 2>&1; then
    echo "Poetry is not installed. Please follow the installation guide at https://python-poetry.org/docs/#installation"
    exit 1
fi

# Set cli app name dynamically
PROJECT_NAME=$(poetry run python -c "import toml; print(toml.load('pyproject.toml')['tool']['poetry']['name'])")
PROJECT_VERSION=$(poetry run python -c "import toml; print(toml.load('pyproject.toml')['tool']['poetry']['version'])")

# Clean dist/ so you can increment version and not run into issues
rm -f dist/*.whl

poetry build || { echo "Error building the package"; error_occurred=true; }

WHEEL_FILE=$(find dist -name "*.whl")

# Install the package
pip install --user "$WHEEL_FILE" || { echo "Error installing the package"; error_occurred=true; }


# Add user-level Python bin directory to PATH if not already present
if ! grep -q "export PATH=\$HOME/.local/bin:\$PATH" ~/.bashrc; then
    echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
    echo 'Added $HOME/.local/bin to PATH in ~/.bashrc'
fi

# Detect other shell configurations and add the PATH entry
SHELL_CONFIGS=(~/.zshrc ~/.bash_profile)
for shell_config in "${SHELL_CONFIGS[@]}"; do
    if [ -f "$shell_config" ] && ! grep -q "export PATH=\$HOME/.local/bin:\$PATH" "$shell_config"; then
        echo 'export PATH=$HOME/.local/bin:$PATH' >> "$shell_config"
        echo "Added \$HOME/.local/bin to PATH in $shell_config"
    fi
done

source ~/.bashrc

if [ "$error_occurred" = false ]; then
    echo "Installation successful! You can now run the command '${PROJECT_NAME}'"
else
    echo "Installation failed. Please review the error messages above."
fi
