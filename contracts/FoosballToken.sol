pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';
import 'zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol';


contract FoosballToken is MintableToken, DetailedERC20("Foosball Token", "FOO", 0) {
    
}