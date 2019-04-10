pragma solidity 0.4.24;

contract Owned {

    address private contractOwner;

    constructor() public {
        contractOwner = msg.sender;
    }

    event LogOwnerSet(address contractOwner, address newOwner);

    modifier fromOwner() {
        require(msg.sender == contractOwner, "You are not the owner!");
        _;
    }

    function setOwner(address newOwner) public fromOwner returns (bool success) {
        require(contractOwner != newOwner, "New owner is already the owner!");
        require(newOwner != address(0), "The address is not set!");
        emit LogOwnerSet(contractOwner, newOwner);
        contractOwner = newOwner;
        success = true;
    }

    function getOwner() view public returns (address owner) {
        return contractOwner;
    }
}
