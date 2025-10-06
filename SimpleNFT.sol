// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Simple NFT (ERC-721-like minimal)
/// @notice Minimal educational NFT implementation — NOT fully ERC-721 compliant, but sufficient for testing/demos.
contract SimpleNFT {
    string public name = "SimpleNFT";
    string public symbol = "SNFT";

    uint256 private _nextTokenId;
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    function balanceOf(address owner) external view returns (uint256) {
        require(owner != address(0), "zero address");
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "nonexistent");
        return owner;
    }

    function mint() external returns (uint256) {
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        _owners[tokenId] = msg.sender;
        _balances[msg.sender] += 1;
        emit Transfer(address(0), msg.sender, tokenId);
        return tokenId;
    }

    function transferFrom(address from, address to, uint256 tokenId) external {
        address owner = ownerOf(tokenId);
        require(owner == from, "not owner");
        require(msg.sender == owner || msg.sender == _tokenApprovals[tokenId] || _operatorApprovals[owner][msg.sender], "not approved");
        require(to != address(0), "zero address");
        _approve(address(0), tokenId);
        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;
        emit Transfer(from, to, tokenId);
    }

    function approve(address to, uint256 tokenId) external {
        address owner = ownerOf(tokenId);
        require(owner == msg.sender, "not owner");
        _tokenApprovals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }

    function _approve(address to, uint256 tokenId) internal {
        _tokenApprovals[tokenId] = to;
        emit Approval(ownerOf(tokenId), to, tokenId);
    }
}
