# DeFi Kingdom Clone on Avalanche
Welcome to the DeFi Kingdom clone project on the Avalanche CLI! This project replicates features from the original DeFi game, including Battling, Trading, and Exploring. It uses Solidity smart contracts to implement these features on an Avalanche EVM Subnet.

## Description

This project includes several smart contracts:

1. **ERC20**: Implements the ERC20 token standard with minting, burning, and transferring capabilities.
2. **Vault**: Acts as an in-game bank where players can deposit and withdraw tokens.
3. **AdventuresQuest**: Manages exploration activities and rewards in different dungeons.

## Getting Started

### Executing the Program

1. **Install Remix IDE**: To run and deploy these contracts, use [Remix IDE](https://remix.ethereum.org/). 

2. **Download Files**: Clone or download the repository containing the smart contracts and upload them to Remix IDE.

3. **Set Up Avalanche CLI**: 
   - Install the Avalanche CLI tool. Follow the [official installation guide](https://docs.avax.network/build/avalanchego/avalanche-cli).
   - Create a custom subnet on your local machine.

### Creating a Custom Subnet

1. **Install Avalanche CLI Tool**:
   ```bash
   npm install -g avalanche-cli
   ```

2. **Create a New Subnet**:
   ```bash
   avalanche subnet create SubnetMuskan
   ```

3. **Select EVM Subnet Option**:
   Choose the `SubnetEVM` option during the creation process.

4. **Deploy the Subnet**:
   ```bash
   avalanche subnet deploy SubnetMuskan
   ```

5. **View Subnet Details**:
   The console will display the details about your newly created subnet.

6. **Connect to MetaMask**:
   - Add the custom subnet to MetaMask.
   - Use the Injected provider - MetaMask in Remix IDE.

## Functionality

### ERC20 Contract
- **Minting**: `mint(uint amount)`
- **Burning**: `burn(uint amount)`
- **Transferring**: `transfer(address recipient, uint amount)`
- **Approval**: `approve(address spender, uint amount)`
- **TransferFrom**: `transferFrom(address sender, address recipient, uint amount)`

### Vault Contract
- **Deposit**: `deposit(uint amount)`
- **Withdraw**: `withdraw(uint shares)`


### AdventuresQuest Contract
- **Register**: `register()`
- **Explore**: `explore((QuestType questType)
- **Get Adventurer**: ` getAdventurer(address adventurer)`
- **Get Adventurer Count**: `getAdventurerCount()`
- **Get Top Adventurer**: `getTopExplorers(uint256 limit)`
- **Get All Adventurer**: `getAllAdventurers()`


## Working

1. **Deploy ERC20 Contract**: Compile and deploy the ERC20 contract first. Copy the contract address.

2. **Deploy Vault Contract**: Use the ERC20 contract address as a parameter for the Vault contract constructor.

3. **Deploy AdventuresQuest Contract**: Deploy the AdventuresQuest contract, specifying any required initial parameters 

## Authors

- **Muskan** 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
