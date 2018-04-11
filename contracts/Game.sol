pragma solidity ^0.4.19;

import './FoosballToken.sol';
import './MatchFactory.sol';


contract Game {

    FoosballToken public token;
    MatchFactory public factory;

    mapping(address => bool) public registered;

    function Game() public {
        token = new FoosballToken();
        factory = new MatchFactory(address(token));
    }

    modifier onlyOnce() {
        require(!registered[msg.sender]);
        _;
    }

    function register() public onlyOnce {
        registered[msg.sender] = true;
        token.mint(msg.sender, 1000);
    }
}