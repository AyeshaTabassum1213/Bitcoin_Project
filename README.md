# BTC-TestFlow Bitcoin E2E Testing Suite

A powerful, one-click testing toolkit for Bitcoin developers: regtest node setup, wallet management, transaction simulation, and AI-enabled insights.  

**Key Features**  
- One-click Regtest Setup with Docker Compose or setup script  
- Auto-funded wallets, wallet tracking, and transaction execution  
- Unified integration with Bitcoin Core RPC and Xverse wallet  
- Live Dashboard to view node status, transactions, and balances  
- AI Insights (Simulated) to predict failures and suggest testing optimizations  
- Interactive Testing Tools with real-time analytics using Tailwind/React UI  

**Tech Stack**  
- **Frontend:** React 18, TypeScript, Tailwind CSS  
- **Blockchain:** Bitcoin Core (regtest), midl.js, Xverse API  
- **Infrastructure:** Docker Compose, Nginx, setup script (`setup-regtest.sh`)  

**Setup Guide**  
```bash
git clone https://github.com/your-username/BTC-TestFlow.git
cd BTC-TestFlow
npm install
