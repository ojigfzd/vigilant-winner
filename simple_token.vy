# simple_token.vy
# Minimal ERC20-like token in Vyper
# Uses Vyper syntax; simplified for demo purposes
name: public(String[64])
symbol: public(String[32])
decimals: public(uint256)
totalSupply: public(uint256)

balances: HashMap[address, uint256]
allowances: HashMap[address, HashMap[address, uint256]]

@external
def __init__():
    self.name = "VyperToken"
    self.symbol = "VYTK"
    self.decimals = 18
    initial: uint256 = 1000 * 10 ** 18
    self.totalSupply = initial
    self.balances[msg.sender] = initial

@external
def balanceOf(owner: address) -> uint256:
    return self.balances[owner]
