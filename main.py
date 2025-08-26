from blockchain_api import BlockchainAPI

if __name__ == "__main__":
    api = BlockchainAPI()

    # Get latest block
    latest_block = api.get_latest_block()
    print("Latest Block:", latest_block)

    # Get Bitcoin address balance
    test_address = "1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY"
    balance = api.get_address_balance(test_address)
    print("Address Balance:", balance)

    # Get transaction details
    tx_hash = "b6f6991d06c8c8d7e17d68cbece9d12a8b8b29ab0d10a1c915cf9dbf5b8c6a62"  
    tx_details = api.get_transaction(tx_hash)
    print("Transaction Details:", tx_details)
