# CLI App Installer 🚀
Welcome to the CLI App Installer! Effortlessly install Python CLI apps and feel like a true code wizard 🧙

## Requirements ⚠️
* Assumes you're using Python's Poetry package manager

## Features 🌟
- Hassle-free installation of Python CLI apps
- Automatically handles PATH configuration so you can call your CLI app globally on your system
- Supports multiple shell environments
- Cleanly names your installed CLI app so it's easy to use
- Tells you how to call your CLI app 😊


## Usage 📚
1. Install [Poetry](https://python-poetry.org/docs/#installation) if you don't already have it.

2. Place the `install.sh` script in your Python CLI app's root directory.

3. Navigate to your project's directory and run the script

```
./install.sh
```

4. You can now run your CLI app!


## Example 📖
Suppose you have a CLI app called "my-cli-app" with the following structure:
```
my-cli-app/
├── my_cli_app/
│   ├── __init__.py
│   └── main.py
├── pyproject.toml
└── README.md
```

Place the `install.sh` script in the `my-cli-app` root directory.

Run the `install.sh` script in your terminal:

```
./install.sh
```

If the installation is successful, you can now run your app using its command:
```
my-cli-app
```
Hooray 🥳

## Troubleshooting 🔧
Don't panic! Error messages will guide you. Read them, or don't and just ask the AIs (!) 🤖

## Contributing 🤝
Found bugs or have suggestions? Open an issue or submit a pull request.

## License 📄
This project is licensed under the MIT License. See the LICENSE file for details.
