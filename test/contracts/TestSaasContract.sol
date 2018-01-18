pragma solidity ^0.4.17;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../contracts/SaasContract.sol";

contract TestSaasContract {
  SaasContract saasContract;
  address providerAddress = 0x0;
  uint price = 1;
  uint public initialBalance = 1 ether;

  function beforeAll() {
    saasContract = new SaasContract(providerAddress, price);
    saasContract.transfer(initialBalance);
  }

  function testProviderIsSet() {
    address expectedProvider = providerAddress;
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
