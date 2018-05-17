pragma solidity ^0.4.21;

import 'openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract HussyToken is StandardToken {
  string public name = "HUSSY"; 
  string public symbol = "HUS";
  uint public decimals = 18;
  uint public INITIAL_SUPPLY = 100000000 * (10 ** uint256(decimals));

  function HussyToken() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }
}
