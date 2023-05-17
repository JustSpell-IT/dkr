#!/bin/bash

# Ensure Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker could not be found"
    exit
fi

# Display help
display_help() {
    echo "Usage: dkr [action] [--force]"
    echo "Actions:"
    echo "  stop     Stops all Docker containers"
    echo "  remove   Stops and removes all Docker containers"
    echo "Options:"
    echo "  --force  Forces the stop or remove process"
}

# Check if help flag is set or no arguments provided
if [ "$1" == "--help" ] || [ "$1" == "-h" ] || [ -z "$1" ]
then
    display_help
    exit
fi

ACTION=$1
FORCE=""

# Check if force flag is set
if [ "$2" == "--force" ]
then
    FORCE="-f"
fi

# Perform the requested action
case $ACTION in
    "stop")
        echo "Stopping all Docker containers..."
        docker stop $FORCE $(docker ps -aq)
        ;;
    "remove")
        echo "Stopping and removing all Docker containers..."
        docker rm $FORCE $(docker ps -aq)
        ;;
    *)
        echo "Invalid action. Please provide: stop, remove"
        display_help
        ;;
esac
