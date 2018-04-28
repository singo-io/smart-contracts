var TokenVestingFactory = artifacts.require("TokenVestingFactory");

module.exports = function(deployer) {
  deployer.deploy(TokenVestingFactory);
};
