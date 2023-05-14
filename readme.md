

### **How to deploy this project** 
1. Install [Foundry](https://github.com/foundry-rs/foundry) (you can get some ressources [here](https://book.getfoundry.sh/)).
2. Copy `example.env` to `.env` file at the root of your project and complete it with your own private keys.
3. Run these three commands:
```
source .env
forge install
forge test -vv
forge script script/Deploy_MUMBAI.s.sol:DeployScript --broadcast --rpc-url ${RPC_URL_MUMBAI} --verifier-url ${VERIFIER_URL_MUMBAI} --etherscan-api-key ${POLYGON_ETHERSCAN_API_KEY} --verify
```

