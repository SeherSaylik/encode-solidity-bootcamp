const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Access Control", function () {
  let volcanoCoin;
  beforeEach(async () => {
    const VolcanoCoin = await ethers.getContractFactory("VolcanoCoin");
    volcanoCoin = await VolcanoCoin.deploy();
  });
  it("should only allow to the owner to increase the supply", async () => {
    const [owner, addr1] = await ethers.getSigners();
    await expect(
      volcanoCoin.connect(addr1).increaseSupply()
    ).to.be.revertedWith("Ownable: caller is not the owner");
  });
});
