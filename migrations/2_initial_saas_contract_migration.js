var SaasContract = artifacts.require("./SaasContract.sol");

module.exports = function(deployer) {
  deployer.deploy(SaasContract);
};
