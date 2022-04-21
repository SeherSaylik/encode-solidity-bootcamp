const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Supply Functionality", function () {
  let volcanoCoin;
  beforeEach(async () => {
    const VolcanoCoin = await ethers.getContractFactory("VolcanoCoin");
    volcanoCoin = await VolcanoCoin.deploy();
  });
  it("should have a supply of 1000", async () => {
    const supply = await volcanoCoin.totalSupply();
    expect(supply).to.equal(1000, "Initial supply is not 1000");
  });
  it("should increase the supply by 1000", async () => {
    await volcanoCoin.increaseSupply();
    const supply = await volcanoCoin.totalSupply();
    expect(supply).to.equal(2000, "Supply is not increasing by 1000");
  });
});
