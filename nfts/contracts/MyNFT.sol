// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";


// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyNFT is ERC721{
    // OpenZeppelin Counters to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // We need to pass the name of our NFTs token and its symbol.
    constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is my NFT contract. Woah!");
  }


    // User function to get their NFT.
    function makeNFT() public {
        // Get current tokenId
        uint256 newItemId = _tokenIds.current();

        // mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Return NFT's metadata
        tokenURI(newItemId);

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }

    // Set the NFT's metadata
  function tokenURI(uint256 _tokenId) public view override returns (string memory) {
    require(_exists(_tokenId));
    console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
    return "https://jsonkeeper.com/b/T03V";
  }
}