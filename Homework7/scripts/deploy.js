const hre = require("hardhat");

async function deployment() {
  const VolcanoCoin = await hre.ethers.getContractFactory("VolcanoCoin");
  const volcanoCoin = await VolcanoCoin.deploy();
  console.log("Volcano Coin address:", volcanoCoin.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
