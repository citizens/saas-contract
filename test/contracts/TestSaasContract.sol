pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../contracts/SaasContract.sol";

contract TestSaasContract {
  SaasContract saasContract;

  function beforeEach() {
    saasContract = new SaasContract(0x0);
  }

  function testProviderIsSet() {
    address expectedProvider = 0x0;
    address receivedProvider = saasContract.provider();
    Assert.equal(expectedProvider, receivedProvider, "The provider was not set");
  }

  function testSubscriptionIsSet() {
    uint expectedStartDate = block.timestamp;
    uint expectedEndDate = block.timestamp + uint(30*24*60*60*1000);
    Assert.equal(saasContract.startDate(), expectedStartDate, "Start date is incorrect");
    Assert.equal(saasContract.endDate(), expectedEndDate, "End date is incorrect");
  }
}
