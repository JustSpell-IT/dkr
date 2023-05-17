# Docker Control (dkr) Script

This is a simple bash script to manage Docker containers. It allows you to stop and remove all Docker containers with optional force flag.

## Prerequisites

The script requires Docker to be installed on your system.

## Installation

1. Download the `dkr` script.
2. Make the script executable with the following command: `chmod +x dkr`.
3. Move the script to a directory in your PATH (e.g., `/usr/local/bin/`) with the command: `sudo mv dkr /usr/local/bin/`.

## Usage

The script can be used with the following commands:

- `dkr stop`: Stops all Docker containers.
- `dkr stop --force`: Forcefully stops all Docker containers.
- `dkr remove`: Stops and removes all Docker containers.
- `dkr remove --force`: Forcefully stops and removes all Docker containers.

You can display the help message with `dkr --help` or `dkr -h`, which will show available actions and options.

## License

This project is licensed under the MIT License.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
