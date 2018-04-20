pragma solidity ^0.4.18;
/*
JDAllen.

Primary setter and getter for KYC/STD/PoC on-chain.

This SC is seperate from the  listings.sol (peter) - diff data structs
and  encompass also the functions
for set/ get a listing and any client reports ? (Peter) - architecture confirm.

Arguments for these on-chain state - determined as 4 and set as strings
Could reduce to bytes32 for less gas usage..  TBD -- depends on KYC/STD/PoC data
that needs to be stored by various entities.

SafeMath not needed.

WIP. 20 / 4 / 18.

The _address is the on-file wallet address of the Service Provider

*/

pragma solidity ^0.4.18;


/**
 * @title Helps contracts guard agains reentrancy attacks.
 * @author Remco Bloemen <remco@2π.com>
 * @notice If you mark a function `nonReentrant`, you should also
 * mark it `external`.
 */
contract ReentrancyGuard {

  /**
   * @dev We use a single lock for the whole contract.
   */
  bool private reentrancy_lock = false;

  /**
   * @dev Prevents a contract from calling itself, directly or indirectly.
   * @notice If you mark a function `nonReentrant`, you should also
   * mark it `external`. Calling one nonReentrant function from
   * another is not supported. Instead, you can implement a
   * `private` function doing the actual work, and a `external`
   * wrapper marked as `nonReentrant`.
   */
  modifier nonReentrant() {
    require(!reentrancy_lock);
    reentrancy_lock = true;
    _;
    reentrancy_lock = false;
  }

}




pragma solidity ^0.4.18;


/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}




pragma solidity ^0.4.18;

contract kycstdsetget is Ownable {

  struct Spkycstdconfirms {
    bytes32 arg1;
    bytes32 arg2;
    bytes32 arg3;
    bytes32 arg4;
  }

bool _confirm;

mapping (address => Spkycstdconfirms) spconfirms;
address[] private spconfirmsarray;

  event Kycstdsetok (bool _confirm );

  event Kycstdgetok (
    address _address,
    bytes32 _arg1,
    bytes32 _arg2,
    bytes32 _arg3,
    bytes32 _arg4
);

  function kycstdsetget()
{

    }  // Fallback - TBD


  function kycstdset(address _address, bytes32 _arg1, bytes32 _arg2, bytes32 _arg3, bytes32 _arg4) onlyOwner private returns (bool)
  {
    var spprovider = spconfirms[_address];

    spprovider.arg1 = _arg1;
    spprovider.arg2 = _arg2;
    spprovider.arg3 = _arg3;
    spprovider.arg4 = _arg4;

    spconfirmsarray.push(_address)-1;

    //  Only owner can set the state - can change from front end if needs be - TBD

    emit Kycstdsetok ( _confirm );

  }


  function kycstdget(address _address) private returns  (bytes32, bytes32, bytes32, bytes32)
  {
    return (spconfirms[_address].arg1,spconfirms[_address].arg2,spconfirms[_address].arg3,spconfirms[_address].arg4);


    emit Kycstdgetok (_address, spconfirms[_address].arg1,spconfirms[_address].arg2,spconfirms[_address].arg3,spconfirms[_address].arg4);
  }
}
