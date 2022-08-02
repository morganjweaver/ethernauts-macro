import { expect } from "chai";
import { Contract } from "ethers";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  for (let i = 0; i < 10; i++) {
    attacker.hackContract();
  }
  console.log(`Loop consec wins: ${await victim.consecutiveWins()}`);
};

export default helper;
