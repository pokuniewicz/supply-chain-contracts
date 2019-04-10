const MedicineSupplier = artifacts.require("MedicineSupplier");

module.exports = function(deployer) {
    deployer.deploy(MedicineSupplier);
};
