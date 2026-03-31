// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@layerzerolabs/lz-evm-oapp-v2/contracts/onft/ONFT721.sol";

/**
 * @title OmnichainNFT
 * @dev Implementation of LayerZero ONFT721 for seamless cross-chain transfers.
 */
contract OmnichainNFT is ONFT721 {
    uint256 public nextTokenId;
    uint256 public immutable maxSupply;

    constructor(
        string memory _name,
        string memory _symbol,
        address _lzEndpoint,
        address _delegate,
        uint256 _maxSupply
    ) ONFT721(_name, _symbol, _lzEndpoint, _delegate) {
        maxSupply = _maxSupply;
    }

    /**
     * @dev Mint function for initial distribution on the primary chain.
     */
    function mint(address _to) external {
        require(nextTokenId < maxSupply, "Exceeds max supply");
        _safeMint(_to, nextTokenId++);
    }

    /**
     * @dev Internal function to handle the burning/minting during cross-chain calls.
     */
    function _debit(
        address _from,
        uint256 _tokenId,
        uint32 _dstEid
    ) internal virtual override returns (uint256) {
        return super._debit(_from, _tokenId, _dstEid);
    }

    function _credit(
        address _to,
        uint256 _tokenId,
        uint32 _srcEid
    ) internal virtual override returns (uint256) {
        return super._credit(_to, _tokenId, _srcEid);
    }
}
