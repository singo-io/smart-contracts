pragma solidity ^0.4.21;

import 'zeppelin-solidity/contracts/token/ERC20/TokenVesting.sol';

contract TokenVestingFactory is Ownable {
    event Created(TokenVesting vesting);
    function create(
        address _beneficiary,
        uint256 _start,
        uint256 _cliff,
        uint256 _duration
    ) onlyOwner public returns (TokenVesting) {
        TokenVesting vesting = new TokenVesting(
            _beneficiary,
            _start,
            _cliff,
            _duration,
            true
        );
        emit Created(vesting);
        return vesting;
    }
}
