# Prefect ControlFlow Demo

This project demonstrates the setup and usage of Prefect's ControlFlow framework. It includes a shell script to set up SQLite (if missing), start the Prefect server, and run the demo notebook.

## Features

- Demonstrates Prefect's ControlFlow framework.
- Automated setup for SQLite and Prefect server.
- Includes a demo notebook for hands-on learning.

## Prerequisites

- [Python 3.9+](https://www.python.org/downloads/)
- [UV](https://github.com/PrefectHQ/prefect) for dependency management.
- [Prefect](https://www.prefect.io/) installed.
- [Jupyter Notebook](https://jupyter.org/) for running the demo.

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/amruthvvkp/controlflow-demo.git
   ```
2. Navigate to the project directory:
   ```bash
   cd controlflow-demo
   ```
3. Install dependencies using UV:
   ```bash
   uv install
   ```

## Running the Demo

1. Run the setup script to configure SQLite and start the Prefect server:
   ```bash
   ./start_prefect_server.sh
   ```
   - The script will check for SQLite and install it if missing.
   - It will start the Prefect server.

2. Open the demo notebook:
   ```bash
   jupyter notebook demo.ipynb
   ```
3. Follow the instructions in the notebook to explore Prefect's ControlFlow framework.

## Notes

- Ensure the Prefect server is running before executing the notebook.
- The demo assumes a local SQLite database for simplicity.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.
