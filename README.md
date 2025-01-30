# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

#Basics
```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```


#1. Create contracts/{NameContract}.sol

#2.
```shell
npx hardhat compile
npx hardhat run scripts/deploy.js --network hardhat
```

#3 Test contracts
```shell
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost
npx hardhat console --network localhost
```

#4 Call contract functions
```js
const [deployer] = await ethers.getSigners();
const contract = await ethers.getContractAt("CONTRACT", "DEPLOYED_CONTRACT_ADDRESS");
await contract.functionName();
console.log(await contract.functionName());
```

ou

```shell
npx hardhat run scripts/interact.js --network localhost
```
