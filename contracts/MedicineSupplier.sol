pragma solidity 0.4.24;

import "./Supplier.sol";

contract MedicineSupplier is Supplier {

    struct Medicine {
        string name;
        string description;
        uint256 productionDate;
        bool exist;
    }

    mapping(string => Medicine) medicines;

    event AddMedicine(address supplier, string id, string name, string description, uint256 productionDate);
    event GetMedicine(string id, string name, string description, uint256 productionDate);

    function addMedicine(string id, string name, string description, uint256 productionDate) public fromSupplier returns (bool success) {
        require(!medicines[id].exist, "Medicine already exists!");
        medicines[id].name = name;
        medicines[id].description = description;
        medicines[id].productionDate = productionDate;
        medicines[id].exist = true;
        success = true;
        emit AddMedicine(msg.sender, id, name, description, productionDate);
    }

    function getMedicine(string id) view public returns (string name, string description, uint256 productionDate) {
        require(medicines[id].exist, "Medicine does not exist!");
        Medicine storage medicine = medicines[id];
        return (medicine.name, medicine.description, medicine.productionDate);
    }
}
