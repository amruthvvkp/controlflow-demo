#!/bin/bash

# Set the Prefect API database connection URL to use an in-memory SQLite database
echo "Configuring Prefect API to use an in-memory SQLite database..."
prefect config set PREFECT_API_DATABASE_CONNECTION_URL="sqlite+aiosqlite:///file::memory:?cache=shared&uri=true&check_same_thread=false"

# Check if SQLite3 is installed
echo "Checking if SQLite3 is installed on the system..."
if ! command -v sqlite3 &> /dev/null; then
    echo "SQLite3 is not installed. Proceeding with installation..."
    
    # Update package lists and install SQLite3
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Detected Linux OS. Installing SQLite3 using apt-get..."
        sudo apt-get update && sudo apt-get install -y sqlite3
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Detected macOS. Installing SQLite3 using Homebrew..."
        brew install sqlite3
    else
        echo "Unsupported OS. Please install SQLite3 manually."
        exit 1
    fi

    # Reset and upgrade the Prefect server database
    echo "Resetting and upgrading the Prefect server database..."
    prefect server database reset -y
    prefect server database upgrade -y
else
    echo "SQLite3 is already installed on the system!"
    echo "SQLite3 version:"
    sqlite3 --version
fi

# Start the Prefect server
echo "Starting the Prefect Server..."
export PREFECT_PORT=4200
echo "Setting Prefect API URL to http://0.0.0.0:$PREFECT_PORT/api..."
prefect config set PREFECT_API_URL=http://0.0.0.0:$PREFECT_PORT/api
echo "Validating the Prefect configuration..."
prefect config validate

echo "Launching Prefect Server with the following parameters:"
echo "  - Host: 0.0.0.0"
echo "  - Port: $PREFECT_PORT"
echo "  - Analytics: Disabled"
echo "  - Log Level: WARNING"
prefect server start --host 0.0.0.0 --analytics-off --port $PREFECT_PORT --log-level WARNING
