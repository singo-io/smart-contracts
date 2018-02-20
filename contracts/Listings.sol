pragma solidity ^0.4.15;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract Listings is Ownable {
    mapping (address => bytes32) listings;

    // We are not able to iterate listings mapping, hence we store a list of addresses in an array
    address[] addressList;


    function getListing(address _address) public view returns (bytes32) {
        return listings[_address];
    }


    function getAddressList() public view returns (address[]) {
        return addressList;
    }


    function addListing(address _address, bytes32 _ipfsHash) public onlyOwner {
        // Make sure that the listing with this address does not exist already
        require(listings[_address] == 0);

        // Append the address to addressList
        addressList.push(_address);

        // Store data object for given address
        listings[_address] = _ipfsHash;
    }


    function removeListing(address _address) public onlyOwner {
        // Special case when we have just a single element in addressList
        if (addressList.length == 1) {
            addressList.length = 0;
            return;
        }

        // Find the position of _address in addressList
        uint i;
        while (i < addressList.length && addressList[i] != _address) {
            i++;
        }

        // Ensure that the _address actually is in the addressList
        require(addressList[i] == _address);

        // Move the last element in addressList to the position of _address in addressList
        addressList[i] = addressList[addressList.length-1];
        addressList.length--;

        // Delete the value from the listings mapping
        delete listings[_address];
    }
}
