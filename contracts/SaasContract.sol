pragma solidity ^0.4.18;
import 'zeppelin-solidity/contracts/token/StandardToken.sol';

contract SaasContract is StandardToken {
  address public provider;
  address public subscriber;
  uint public startDate;
  uint public endDate;

  function SaasContract(address _provider) public {
    require(msg.sender != _provider);
    provider = _provider;
    subscriber = msg.sender;
    subscribe();
  }

  function subscribe() public {
    startDate = block.timestamp;
    endDate = block.timestamp + uint(30*24*60*60*1000);
  }
}
