# Multichain NFT Bridge (LayerZero)

A professional-grade implementation of an Omnichain NFT. This repository allows an NFT to exist across multiple blockchains (Ethereum, Polygon, Arbitrum, etc.) without the need for traditional wrapped liquidity pools. Instead, it uses LayerZero's messaging protocol to handle the "Burn on Source / Mint on Destination" logic.

## Core Features
* **Native Interoperability:** No wrapped assets; the NFT identity remains consistent across chains.
* **LayerZero V2 Integration:** Utilizes the latest OApp and ONFT standards.
* **Gas Efficiency:** Optimized cross-chain messaging for low-cost transfers.
* **Flat Structure:** All bridge logic, endpoint configurations, and NFT metadata in a single directory.

## Workflow
1. **Deploy:** Deploy the ONFT contract on both Chain A and Chain B.
2. **Wire:** Call `setPeer` on both chains to authorize the cross-chain connection.
3. **Send:** Call `sendFrom` to move the NFT. The asset is burned on the source and minted on the destination.

## Setup
1. `npm install`
2. Update `LayerZero Endpoint` addresses in `ONFTBridge.sol`.
