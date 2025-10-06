# Solidity Example Contracts

This repository contains minimal, educational Solidity contracts to demonstrate:
- A simple ERC-20-like token (`SimpleToken.sol`)
- A minimal ERC-721-like NFT (`SimpleNFT.sol`)
- A simple staking contract that accepts `SimpleToken` (`SimpleStaking.sol`)

**Notes**
- These contracts are simplified for learning and demo purposes. They are NOT production-ready.
- Use Solidity `^0.8.20` (works with other 0.8.x compilers as well).
- Recommended flow:
  1. Deploy `SimpleToken` (give initial supply to deployer).
  2. Approve `SimpleStaking` to spend tokens on behalf of user for staking.
  3. Stake, wait, claim rewards (in this demo rewards are transferred from the staking contract balance).

Example commit messages to use when adding to GitHub:
- Add initial SimpleToken contract
- Add SimpleNFT demo contract
- Add SimpleStaking contract and README
