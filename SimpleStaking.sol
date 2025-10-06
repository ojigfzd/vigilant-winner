// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./SimpleToken.sol";

/// @title Simple Staking Contract
/// @notice Users can stake SimpleToken (ERC-20) to earn a simple reward rate.
contract SimpleStaking {
    SimpleToken public stakingToken;
    address public owner;

    uint256 public rewardRatePerBlock = 1; // tokens per block per staker (very simplified)
    mapping(address => uint256) public staked;
    mapping(address => uint256) public rewardDebt;
    mapping(address => uint256) public lastBlock;

    event Stake(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);
    event Claim(address indexed user, uint256 reward);

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner");
        _;
    }

    constructor(address tokenAddress) {
        stakingToken = SimpleToken(tokenAddress);
        owner = msg.sender;
    }

    function stake(uint256 amount) external {
        require(amount > 0, "zero amount");
        // transfer tokens to this contract
        require(stakingToken.transferFrom(msg.sender, address(this), amount), "transfer failed");
        _updateReward(msg.sender);
        staked[msg.sender] += amount;
        emit Stake(msg.sender, amount);
    }

    function withdraw(uint256 amount) external {
        require(staked[msg.sender] >= amount, "not enough");
        _updateReward(msg.sender);
        staked[msg.sender] -= amount;
        require(stakingToken.transfer(msg.sender, amount), "transfer failed");
        emit Withdraw(msg.sender, amount);
    }

    function claim() external {
        _updateReward(msg.sender);
        uint256 reward = rewardDebt[msg.sender];
        require(reward > 0, "no reward");
        rewardDebt[msg.sender] = 0;
        // minting reward by owner (simple model): owner should fund contract or mint beforehand
        require(stakingToken.transfer(msg.sender, reward), "reward transfer failed");
        emit Claim(msg.sender, reward);
    }

    function _updateReward(address user) internal {
        uint256 from = lastBlock[user] == 0 ? block.number : lastBlock[user];
        if (staked[user] > 0) {
            uint256 blocks = block.number - from;
            uint256 pending = blocks * rewardRatePerBlock;
            rewardDebt[user] += pending;
        }
        lastBlock[user] = block.number;
    }

    function setRewardRate(uint256 rate) external onlyOwner {
        rewardRatePerBlock = rate;
    }
}
