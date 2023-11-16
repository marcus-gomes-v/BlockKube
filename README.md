![BlockKube](logo-dark.png#gh-dark-mode-only)
![BlockKube](logo.png#gh-light-mode-only)

# BlockKube: Blockchain Management on Kubernetes

BlockKube is an innovative project that simplifies the process of setting up, configuring, and managing blockchain networks on Kubernetes. Designed for both private and public blockchain environments, BlockKube offers an interactive command-line interface that guides users through the entire process of deploying a blockchain network. Its flexibility allows customization of blockchain parameters and easy integration with Kubernetes, making it an ideal choice for developers and organizations looking to leverage blockchain technology in a cloud-native ecosystem.

## Key Features:

1. ##### Automatic Configuration:

   BlockKube streamlines the configuration of blockchain networks, making it easy for users to get started without needing in-depth knowledge of blockchain internals.
2. ##### Private and Public Blockchain Support:

   Whether you're setting up a private blockchain for internal use or a public blockchain for wider access, BlockKube offers the necessary tools and configurations.
3. ##### Kubernetes Integration:

   Leverage the power of Kubernetes to manage blockchain nodes. Kubernetes' scalability and resilience features enhance the blockchain's performance and reliability.
4. ##### User-Friendly CLI:

   A command-line interface that's both intuitive and informative, guiding users through each step of the blockchain setup and management process.

## Requirements for Running BlockKube:

To run BlockKube efficiently, you need to have the following prerequisites installed on your system:

1. **Node.js** : A JavaScript runtime environment that is essential for running the BlockKube script.
2. **Docker** : A platform used for running applications in isolated environments called containers. BlockKube utilizes Docker to containerize blockchain nodes, ensuring consistency across different environments.
3. **Minikube or Docker Desktop** :

* **Minikube** : A tool that runs a single-node Kubernetes cluster locally on your machine. It is ideal for users who want to try out Kubernetes or develop with it day-to-day.
* **Docker Desktop (with Kubernetes)** : An alternative to Minikube, Docker Desktop provides Kubernetes support on your local development machine. It's a suitable option for those who already use Docker Desktop and prefer an integrated environment.

These tools collectively ensure that BlockKube can run a blockchain network within a Kubernetes environment, either for testing, development, or production purposes.

## Running BlockKube:

To start using BlockKube:

1. Clone the BlockKube repository to your local machine.
2. Ensure that Node.js, Docker, and either Minikube or Docker Desktop (with Kubernetes enabled) are installed and properly configured on your system.
3. Navigate to the directory where BlockKube is stored.
4. Run the command ``bash start.sh``. This script initiates the BlockKube interface, where you can choose various options for setting up and managing your blockchain network.
5. Follow the on-screen instructions provided by the BlockKube interface to configure and deploy your blockchain environment.


## Commands and Usage:

* **Auto (A)** : Automates the entire process of starting Minikube (if required), running the BlockKube script, and applying Kubernetes configurations. Ideal for users who want a quick and hassle-free setup.
* **Reset (R)** : Resets the blockchain configurations to their default settings. This option is useful when you need to revert changes or start afresh.
* **Apply Kubernetes Configuration (K)** : Applies the current Kubernetes configurations for the blockchain. This command is useful for deploying updates or changes to the blockchain network.
* **Check Configurations (C)** : Displays the current blockchain environment configurations. Use this to verify or inspect your blockchain settings before deployment.
* **Install Packages (I)** : Installs all necessary packages for BlockKube, ensuring that your environment is ready for blockchain deployment.
* **Exit (E)** : Exits the BlockKube menu and ends the session. Use this when you have completed your tasks or if you wish to exit the program.
