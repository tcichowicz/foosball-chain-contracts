const Game = artifacts.require("./Game.sol");

module.exports = (deployer) => {
  deployer.deploy(Game);
};
