const hre = require("hardhat");

async function main() {
    const MyContract = await hre.ethers.getContractFactory("Counter");
    const contract = await MyContract.deploy();

    await contract.waitForDeployment();
    console.log("Contract deployed to:", await contract.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
