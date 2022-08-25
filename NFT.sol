//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721,ERC721Burnable, Ownable  {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    string public baseTokenURI;

    constructor() ERC721("SAGA", "SAGA") {
        baseTokenURI = "";
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function _baseURI() internal view override returns(string memory) {
        return baseTokenURI;
    }

    function setbaseTokenURI(string memory _uri) public {
        baseTokenURI = _uri;
    } 
}

// https://bafybeig2j4nrilqr4lbn4qatt7dtsoc5m5i4jjzegio5wcmz7xenwfaf4u.ipfs.nftstorage.link/metadata