pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './FoosballToken.sol';


contract Match is Ownable {

    int public constant TEAM_A_VICTORY = -1;
    int public constant DRAW = 0;
    int public constant TEAM_B_VICTORY = 1;

    FoosballToken public token;
    
    string public teamA;
    string public teamB;

    string public score;
    int public result;

    struct Bet {
        address creator;
        uint stake;
        int result;
    }

    Bet[] public bets;

    function Match(address _token, string _teamA, string _teamB) public {
        require(_token != address(0));
        require(bytes(_teamA).length > 0 && bytes(_teamB).length > 0);

        token = FoosballToken(_token);
        teamA = _teamA;
        teamB = _teamB;
    }

    function addBet(uint _stake, int _result) public correctResult(_result) {
        require(_stake > 0);

        require(token.transferFrom(msg.sender, address(this), _stake));

        bets.push(Bet(msg.sender, _stake, _result));
    }

    function getBetsCount() public view returns (uint) {
        return bets.length;
    }

    function setScore(string _score, int _result) public onlyOwner correctResult(_result) {
        require(bytes(_score).length > 0);
        score = _score;
        result = _result;

        uint winningBets = 0;
        uint totalStakes;
        uint totalWinningStakes = 0;
        uint[] memory winningBetIdxs = new uint[](getBetsCount());

        for (uint i = 0; i < getBetsCount(); i++) {
            Bet storage bet = bets[i];
            totalStakes += bet.stake;
            if (bet.result == result) {
                totalWinningStakes += bet.stake;
                winningBetIdxs[winningBets] = i;
                winningBets++;
            }
        }

        for (uint j = 0; j < winningBets; j++) {
            Bet storage winningBet = bets[winningBetIdxs[j]];
            uint prize = (totalStakes * 1000) / ((totalWinningStakes * 1000) / winningBet.stake);
            token.transfer(winningBet.creator, prize);
        }
    }

    modifier correctResult(int _result) {
        require(_result == TEAM_A_VICTORY || _result == DRAW || _result == TEAM_B_VICTORY);
        _;        
    }
}