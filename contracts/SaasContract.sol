pragma solidity ^0.4.18;
import 'zeppelin-solidity/contracts/token/StandardToken.sol';

contract SaasContract is StandardToken {
  address public provider;
  address public subscriber;
  uint public price;
  uint public startDate;
  uint public endDate;

  function SaasContract(address _provider, uint _price) public {
    provider = _provider;
    subscriber = msg.sender;
    price = _price;
  }

  modifier isClient() {
      require(msg.sender == subscriber);
      _;
  }

  function subscribe() isClient public {
    require(this.balance >= price);
    startDate = block.timestamp;
    endDate = block.timestamp + uint(30*24*60*60*1000);
  }
}
