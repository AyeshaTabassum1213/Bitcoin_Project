#!/bin/bash

# BTC-TestFlow Regtest Setup Script
# This script sets up a Bitcoin regtest environment for testing

set -e

echo "🚀 Setting up Bitcoin Regtest Environment for BTC-TestFlow"

# Check if Bitcoin Core is installed
if ! command -v bitcoind &> /dev/null; then
    echo "❌ Bitcoin Core is not installed. Please install Bitcoin Core first."
    echo "Visit: https://bitcoin.org/en/download"
    exit 1
fi

# Create Bitcoin data directory
BITCOIN_DIR="$HOME/.bitcoin"
mkdir -p "$BITCOIN_DIR"

# Create bitcoin.conf for regtest
cat > "$BITCOIN_DIR/bitcoin.conf" << EOF
# Bitcoin Core configuration for BTC-TestFlow
regtest=1
server=1
daemon=1

# RPC Configuration
rpcuser=bitcoin
rpcpassword=bitcoin
rpcport=18443
rpcallowip=127.0.0.1
rpcallowip=0.0.0.0/0

# Network Configuration
port=18444
bind=127.0.0.1:18444

# Wallet Configuration
wallet=testwallet
fallbackfee=0.00001

# Logging
debug=1
printtoconsole=0

# ZMQ (for real-time notifications)
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333

# Transaction Index
txindex=1
EOF

echo "✅ Created bitcoin.conf configuration"

# Stop any existing Bitcoin processes
echo "🛑 Stopping any existing Bitcoin processes..."
pkill -f bitcoind || true
sleep 2

# Start Bitcoin regtest node
echo "🔄 Starting Bitcoin regtest node..."
bitcoind -regtest -daemon

# Wait for node to start
echo "⏳ Waiting for Bitcoin node to start..."
sleep 5

# Check if node is running
if ! bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin getblockchaininfo &> /dev/null; then
    echo "❌ Failed to start Bitcoin regtest node"
    exit 1
fi

echo "✅ Bitcoin regtest node is running"

# Create initial wallet
echo "💼 Creating test wallet..."
bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin createwallet "testwallet" || true

# Generate initial blocks
echo "⛏️  Generating initial blocks..."
MINING_ADDRESS=$(bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin getnewaddress)
bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin generatetoaddress 101 "$MINING_ADDRESS"

# Get blockchain info
BLOCK_COUNT=$(bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin getblockcount)
BALANCE=$(bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin getbalance)

echo ""
echo "🎉 Bitcoin Regtest Environment Setup Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Network Status:"
echo "   • Network: Regtest"
echo "   • Block Height: $BLOCK_COUNT"
echo "   • Wallet Balance: $BALANCE BTC"
echo "   • RPC Port: 18443"
echo "   • P2P Port: 18444"
echo ""
echo "🔗 Connection Details:"
echo "   • RPC URL: http://localhost:18443"
echo "   • Username: bitcoin"
echo "   • Password: bitcoin"
echo ""
echo "🚀 Ready for BTC-TestFlow!"
echo "   Start the application with: npm run dev"
echo ""
echo "📝 Useful Commands:"
echo "   • Check status: bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin getblockchaininfo"
echo "   • Mine blocks: bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin generatetoaddress 1 <address>"
echo "   • Stop node: bitcoin-cli -regtest -rpcuser=bitcoin -rpcpassword=bitcoin stop"
echo ""