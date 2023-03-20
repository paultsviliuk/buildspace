// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Portal {
    uint256 totalInteractions;

    constructor() {
        console.log("Smart contract");
    }

    function interact() public {
        totalInteractions += 1;
        console.log("%s has interacted!", msg.sender);
    }

    function getTotalInteractions() public view returns (uint256) {
        console.log("We have %d total interactions!", totalInteractions);
        return totalInteractions;
    }
}
