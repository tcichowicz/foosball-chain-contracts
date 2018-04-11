pragma solidity ^0.4.19;

import './Match.sol';


contract MatchFactory {

    address public token;
    address[] public matches;

    function MatchFactory(address _token) public {
        require(_token != address(0));
        token = _token;
    }
    
    function addMatch(string _teamA, string _teamB) public {
        Match _match = new Match(token, _teamA, _teamB);
        _match.transferOwnership(msg.sender);
        matches.push(_match);
    }

    function getMatchesCount() public view returns (uint) {
        return matches.length;
    }
}