// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Simple ERC-20 token (educational)
contract SimpleToken {
    string public name = "MultiLangToken";
    string public symbol = "MLTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) private _balances;

    constructor(uint256 initialSupply) {
        _balances[msg.sender] = initialSupply;
        totalSupply = initialSupply;
    }

    function balanceOf(address owner) external view returns (uint256) {
        return _balances[owner];
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(_balances[msg.sender] >= amount, "insufficient");
        _balances[msg.sender] -= amount;
        _balances[to] += amount;
        return true;
    }
}
