#!/bin/bash

# Ensure Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Please install it first."
    exit 1
fi

# Display help
display_help() {
    echo "Usage: dkr [action] [--force]"
    echo "Actions:"
    echo "  stop     Stops all Docker containers"
    echo "  remove   Removes all Docker containers"
    echo "Options:"
    echo "  --force  Forces the stop or remove process"
}

# Check if help flag is set or no arguments provided
if [ "$1" == "--help" ] || [ "$1" == "-h" ] || [ -z "$1" ]
then
    display_help
    exit 0
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
        CONTAINERS=$(docker ps -aq)
        if [ -z "$CONTAINERS" ]; then
            echo "No Docker containers are currently running."
        else
            echo "Stopping all Docker containers..."
            docker stop $FORCE $CONTAINERS
        fi
        ;;
    "remove")
        CONTAINERS=$(docker ps -aq)
        if [ -z "$CONTAINERS" ]; then
            echo "No Docker containers found."
        else
            echo "Stopping and removing all Docker containers..."
            docker stop $CONTAINERS
            docker rm $FORCE $CONTAINERS
        fi
        ;;
    *)
        echo "Invalid action. Please provide: stop, remove"
        display_help
        ;;
esac
