import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  const slotContents = await ethers.provider.getStorageAt(victim.address, 1);
  // const slotContents = await waffle.provider.getStorageAt(victim, 1);
  console.log(`CONTENTS: ${slotContents.toString()}`);
  await victim.unlock(slotContents);
};

export default helper;
