# Foundry Fund Me - F24

How to use: https://github.com/Cyfrin/foundry-fund-me-f23

To start a new Foundry project, use the following command:

```
forge init
```

# Project Structure
## script
This directory contains files for interacting with source contracts.

## src
The main contracts are stored in this directory.

## test
This directory includes files for testing the main contracts.

## Install chainlink contracts

To install Chainlink contracts, use the following command:

```
forge install smartcontractkit/chainlink-brownie-contracts@0.8.0 --no-commit
```

# Testing
## Running a single test

Execute the following command to run a specific test:

```
forge test --mt testPriceFeedVersion
```

## Simulating Transaction with Sepolia

Simulate a transaction using Sepolia with the following command:

```
forge test --mt testPriceFeedVersion -vvv --fork-url $SEPOLIA_RPC_URL
```
Remember to load .env file with _source .env_

## Code Coverage
To generate code coverage, use the following command:

```
forge coverage 
```

Chainlink Aggregator Address for Sepolia
Aggregator chainlink sepolia: **0x694AA1769357215DE4FAC081bf1f309aDC325306**

## Code on the terminal
Use _chisel_

```
forge snapshot --mt testWithdrawWithMultipleFunders
```

# Storage Layout Inspection

Inspect the storage layout using the following commands:

```
forge inspect FundMe storageLayout
cast storage
```

## Inspecting Another Storage

```
cast storage --rpc-url $MAINNET_RPC_URL -e $ETHERSCAN_API_KEY 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48
```

# Testing notes


After making a small change from `address private i_owner;` to `address private immutable i_owner;`, the gas usage for various tests has been optimized. More information about naming conventions can be found [here](https://github.com/smartcontractkit/chainlink/blob/29140a20cb129f21bbf6d808f626ec212167a4c2/contracts/STYLE_GUIDE.md#L4).

- `testOwnerIsDeployer()`: Gas usage reduced from 12581 to 10345
- `testWithdrawFailsIfNotOwner()`: Gas usage reduced from 109194 to 104976
- `testWithdrawWithASingleFunder()`: Gas usage reduced from 86467 to 84504
- `testWithdrawWithMultipleFunders()`: Gas usage reduced from 490091 to 488128
- `testWithdrawWithMultipleFundersCheaper()`: Gas usage reduced from 489295 to 487332


## Naming Conventions

In the project, certain naming conventions are followed:

- Immutable variables are prefixed with `i_`.
- Storage variables are prefixed with `s_`.

For more details and adherence to coding standards, refer to the [Chainlink Style Guide](https://github.com/smartcontractkit/chainlink/blob/29140a20cb129f21bbf6d808f626ec212167a4c2/contracts/STYLE_GUIDE.md#L4).
