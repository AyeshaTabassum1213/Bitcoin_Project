# BTC-TestFlow Bitcoin E2E Testing Suite
A powerful, one-click testing toolkit for Bitcoin developers: regtest node setup, wallet management, transaction simulation, and AI-enabled insights.

## Key Features
- **One-click Regtest Setup** with Docker Compose or setup script  
- **Auto-funded wallets**, wallet tracking, and transaction execution  
- **Unified integration** with Bitcoin Core RPC and Xverse wallet  
- **Live Dashboard**: View node status, transactions, balances  
- **AI Insights (Simulated)**: Predict failures, suggest testing optimizations  
- **Interactive Testing Tools**: Real-time analytics with Tailwind/React UI


## Tech Stack
Frontend: React 18, TypeScript, Tailwind CSS  
Blockchain: Bitcoin Core (regtest), midl.js, Xverse API  
Infrastructure: Docker Compose, Nginx, setup script (`setup-regtest.sh`)



## Setup Guide
git clone https://github.com/your-username/BTC-TestFlow.git
cd BTC-TestFlow
npm install


How It Works

Launches a bitcoind regtest node via Docker

Provides pre-funded wallets for quick testing

Executes transactions using midl.js and monitors status

Connects with Xverse for UI wallet workflows

Displays dashboard with real-time data and simulated insights
