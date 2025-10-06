# token_interact.py
# Minimal example showing how one might interact with an ERC-20 contract using web3.py
# This is a demo: replace provider URL, contract address and ABI for real use.
from web3 import Web3

PROVIDER = "https://mainnet.infura.io/v3/YOUR-PROJECT-ID"
CONTRACT_ADDRESS = "0xYourTokenAddress"
ABI = []  # Put ERC-20 ABI here

def main():
    w3 = Web3(Web3.HTTPProvider(PROVIDER))
    if not w3.isConnected():
        print("Provider not connected")
        return
    contract = w3.eth.contract(address=CONTRACT_ADDRESS, abi=ABI)
    try:
        name = contract.functions.name().call()
        symbol = contract.functions.symbol().call()
        total = contract.functions.totalSupply().call()
        print(f"Token: {name} ({symbol}), totalSupply = {total}")
    except Exception as e:
        print("Error interacting with contract:", e)

if __name__ == '__main__':
    main()
