// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./base/SecurityBase.sol";

contract Geng is ERC721URIStorage, ERC721Enumerable, SecurityBase
{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    mapping(uint256 => string) private _GengMap;
    mapping(string => uint256) private _CheckGengMap;

    event GengCreated(uint256 tokenId, address owner, string geng);

    constructor() ERC721("Geng", "GENG") {
    }


    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal whenNotPaused override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, SecurityBase)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
    
    function safeMintGeng(address to, string memory geng) public whenNotPaused onlyMinter returns (uint256) {
        require(bytes(geng).length <= 128, "geng over bytes32 length 128");
        require(_CheckGengMap[geng] <= 0, "this geng already mint in chain");
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();
        _safeMint(to, tokenId);
        _GengMap[tokenId] = geng;
        _CheckGengMap[geng] = tokenId;
        return tokenId;
    }

    function mintTransform(address from, address to, uint256 tokenId) public whenNotPaused onlyMinter {
        _transfer(from, to, tokenId);
    }

    function mintBurn(uint256 tokenId) public whenNotPaused onlyMinter {
        _burn(tokenId);
    }
}
