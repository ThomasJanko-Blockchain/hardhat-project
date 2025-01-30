const hre = require("hardhat");

async function main() {
    const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";  // Replace with your contract address

    const contract = await hre.ethers.getContractAt("Counter", contractAddress);

    console.log("Current Count:", await contract.getCount());

    console.log("Incrementing...");
    await contract.increment();

    console.log("New Count:", await contract.getCount());

    console.log("Decrementing...");
    await contract.decrement();

    console.log("Final Count:", await contract.getCount());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
