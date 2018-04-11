# Foosball Chain Contracts

Simple smart contracts for free betting on foosball matches results.

Uses [zeppelin-solidity](https://github.com/OpenZeppelin/zeppelin-solidity/) for base ERC20 token implementation.

## Requirements

1. `npm`
1. Truffle Framework

        npm install -g truffle

1. Ganache CLI

        npm install -g ganache-cli

## Project structure
1. `contracts/FoosballToken.sol` - ERC20 mintable token "FOO" for betting purposes
1. `contracts/Game.sol` - the initialization point and contract where users can register to obtain 1000 FOO
1. `contracts/Match.sol` - model for a match, holding the data, result and bets; settles the bets as well
1. `contracts/MatchFactory.sol` - allows anybody to create a match
1. `migrations/2_deploy_game.js` - creates a Game contract which creates all other necessary contracts

## Running the project

1. `npm install` - install dependencies.
1. `truffle compile` - (optional) compile the contracts.
1. `ganache-cli -m "category all reduce guess speed cradle inherit valley gap gasp federal junior"` - run the local Ethereum test node with predefined seed so that importing MetaMask accounts can be done only once.
1. `truffle migrate` - deploy the contracts.
1. Note the Game smart contract address and put it into `web/integration.js` in the UI:

        Running migration: 2_deploy_game.js
            Deploying Game...
            ... 0x83fb3d7d279f7b9d939dc6e84347f5f79eb82d3b35b710c9b2429c47da4b7d36
        Game: 0x4dffc407e3d65e8cccfeb73661fc62e559cccde5
1. Import these seed words into MetaMask to use accounts that are pre-loaded with ETH:

        category all reduce guess speed cradle inherit valley gap gasp federal junior