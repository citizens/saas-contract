pragma solidity ^0.4.18;
import 'zeppelin-solidity/contracts/token/StandardToken.sol';

contract SaasContract is StandardToken {
  address public provider;
  address public subscriber;
  uint public price;
  uint public startDate;
  uint public endDate;

  function SaasContract(address _provider) {
    require(msg.sender != _provider);
    price = 10;
    startDate = block.timestamp;
    endDate = block.timestamp + uint(30*24*60*60*1000);
  }

  function subscribe() public returns (bool) {
    require(msg.sender != provider);
    subscriber = msg.sender;
    return true;
  }
}
