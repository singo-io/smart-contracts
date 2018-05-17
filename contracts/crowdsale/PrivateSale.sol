pragma solidity ^0.4.15;

import 'openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';
import 'openzeppelin-solidity/contracts/crowdsale/emission/AllowanceCrowdsale.sol';
import 'openzeppelin-solidity/contracts/crowdsale/validation/IndividuallyCappedCrowdsale.sol';


contract PrivateSale is AllowanceCrowdsale, IndividuallyCappedCrowdsale {
    function PrivateSale(
        address _tokenWallet,
        address _fundWallet,
        StandardToken _token
    ) public
        Crowdsale(1, _fundWallet, _token)
        AllowanceCrowdsale(_tokenWallet)
        IndividuallyCappedCrowdsale()
    { }

    function setRate(uint256 _rate) external onlyOwner {
        rate = _rate;
    }

    function getRate() public view returns (uint256) {
        return rate;
    }
}
