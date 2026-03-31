const hre = require("hardhat");

async function main() {
  const LZ_ENDPOINT = "0x6EDDE65947B3480391EcD00678564e8371C83D48"; // Example Eid for Sepolia
  const DELEGATE = "0x..."; // Your admin wallet

  const ONFT = await hre.ethers.getContractFactory("OmnichainNFT");
  const onft = await ONFT.deploy(
    "OmniToken",
    "ONFT",
    LZ_ENDPOINT,
    DELEGATE,
    1000 // Max Supply
  );

  await onft.waitForDeployment();
  console.log("Omnichain NFT deployed to:", await onft.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
