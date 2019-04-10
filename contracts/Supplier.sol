pragma solidity 0.4.24;

import "./Owned.sol";

contract Supplier is Owned {

    mapping(address => bool) private suppliers;

    event AddSupplier(address owner, address supplier);
    event RemoveSupplier(address owner, address supplier);

    function addSupplier(address supplier) public fromOwner returns (bool success) {
        require(supplier != address(0), "The address is not set!");
        suppliers[supplier] = true;
        success = true;
        emit AddSupplier(msg.sender, supplier);
    }

    function removeSupplier(address supplier) public fromOwner returns (bool success) {
        require(supplier != address(0), "The address is not set!");
        suppliers[supplier] = false;
        success = true;
        emit RemoveSupplier(msg.sender, supplier);
    }

    function getSupplier(address supplier) view public returns (bool exist) {
        return suppliers[supplier];
    }

    modifier fromSupplier {
        require(suppliers[msg.sender], "Only supplier can perform this operation!");
        _;
    }
}
