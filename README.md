# Start a project

```
forge init
```

## script
files to interact with with src contracts

## src
Store main contracts

## test
files to test the main contracts

## Install chainlink contracts

```
forge install smartcontractkit/chainlink-brownie-contracts@0.8.0 --no-commit
```

## test a single test

```
forge test --mt testPriceFeedVersion
```

## test with sepolia

Simulate transaction
```
forge test --mt testPriceFeedVersion -vvv --fork-url $SEPOLIA_RPC_URL
```

## coverage
```
forge coverage --fork-url $SEPOLIA_RPC_URL 
```

aggregator chainlink sepolia 0x694AA1769357215DE4FAC081bf1f309aDC325306

## chisel
to code solidity in the terminal

```
forge snapshot --mt testWithdrawWithMultipleFunders
```

storage layout

```
forge inspect FundMe storageLayout
cast storage
```
Inspect another storage

cast storage --rpc-url $MAINNET_RPC_URL -e $ETHERSCAN_API_KEY 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48

| Name                 | Type                                            | Slot | Offset | Bytes | Value                                                                         | Hex Value                                                          | Contract                   |
|----------------------|-------------------------------------------------|------|--------|-------|-------------------------------------------------------------------------------|--------------------------------------------------------------------|----------------------------|
| _owner               | address                                         | 0    | 0      | 20    | 1442626706025541066953462928744535818996053290554                             | 0x000000000000000000000000fcb19e6a322b27c06842a71e8c725399f049ae3a | Contract.sol:FiatTokenV2_1 |
| pauser               | address                                         | 1    | 0      | 20    | 417223780715013227085836490829281552150151464294                              | 0x0000000000000000000000004914f61d25e5c567143774b76edbf4d5109a8566 | Contract.sol:FiatTokenV2_1 |
| paused               | bool                                            | 1    | 20     | 1     | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| blacklister          | address                                         | 2    | 0      | 20    | 96326277604683868931173647310888398611398110510                               | 0x00000000000000000000000010df6b6fe66dd319b1f82bab2d054cbb61cdad2e | Contract.sol:FiatTokenV2_1 |
| blacklisted          | mapping(address => bool)                        | 3    | 0      | 32    | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| name                 | string                                          | 4    | 0      | 32    | 38593710624525879730480819364414810941157096808048686924515883081335702552592 | 0x55534420436f696e000000000000000000000000000000000000000000000010 | Contract.sol:FiatTokenV2_1 |
| symbol               | string                                          | 5    | 0      | 32    | 38593711561022257368518379114816214809265752568552928798754351540423798816776 | 0x5553444300000000000000000000000000000000000000000000000000000008 | Contract.sol:FiatTokenV2_1 |
| decimals             | uint8                                           | 6    | 0      | 1     | 6                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000006 | Contract.sol:FiatTokenV2_1 |
| currency             | string                                          | 7    | 0      | 32    | 38593709754705830669425512872126203978950497434864252488535995306481912119302 | 0x5553440000000000000000000000000000000000000000000000000000000006 | Contract.sol:FiatTokenV2_1 |
| masterMinter         | address                                         | 8    | 0      | 20    | 1333102428108959967256747025706552165791885942295                             | 0x000000000000000000000000e982615d461dd5cd06575bbea87624fda4e3de17 | Contract.sol:FiatTokenV2_1 |
| initialized          | bool                                            | 8    | 20     | 1     | 1461501637330902918203684832716283019655932542976                             | 0x0000000000000000000000010000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| balances             | mapping(address => uint256)                     | 9    | 0      | 32    | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| allowed              | mapping(address => mapping(address => uint256)) | 10   | 0      | 32    | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| totalSupply_         | uint256                                         | 11   | 0      | 32    | 22706005298203640                                                             | 0x0000000000000000000000000000000000000000000000000050aafdd4114bf8 | Contract.sol:FiatTokenV2_1 |
| minters              | mapping(address => bool)                        | 12   | 0      | 32    | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| minterAllowed        | mapping(address => uint256)                     | 13   | 0      | 32    | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| _rescuer             | address                                         | 14   | 0      | 20    | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| DOMAIN_SEPARATOR     | bytes32                                         | 15   | 0      | 32    | 3059194987980398594012481128448863428274404045602778523478891455121768244021  | 0x06c37168a7db5138defc7866392bb87a741f9b3d104deb5094588ce041cae335 | Contract.sol:FiatTokenV2_1 |
| _authorizationStates | mapping(address => mapping(bytes32 => bool))    | 16   | 0      | 32    | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| _permitNonces        | mapping(address => uint256)                     | 17   | 0      | 32    | 0                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000000 | Contract.sol:FiatTokenV2_1 |
| _initializedVersion  | uint8                                           | 18   | 0      | 1     | 2                                                                             | 0x0000000000000000000000000000000000000000000000000000000000000002 | Contract.sol:FiatTokenV2_1 |


about testing 

a small change from address private i_owner;
changes the following gas usage
testOwnerIsDeployer() (gas: 12581)
testWithdrawFailsIfNotOwner() (gas: 109194)
testWithdrawWithASingleFunder() (gas: 86467)
testWithdrawWithMultipleFunders() (gas: 490091)
testWithdrawWithMultipleFundersCheaper() (gas: 489295)
to

address private immutable i_owner;
testOwnerIsDeployer() (gas: 10345)
testWithdrawFailsIfNotOwner() (gas: 104976)
testWithdrawWithASingleFunder() (gas: 84504)
testWithdrawWithMultipleFunders() (gas: 488128)
testWithdrawWithMultipleFundersCheaper() (gas: 487332)

inmutables variables have i_
storage variables have s_
more about this: https://github.com/smartcontractkit/chainlink/blob/29140a20cb129f21bbf6d808f626ec212167a4c2/contracts/STYLE_GUIDE.md#L4