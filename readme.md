

### **How to deploy this project** 
1. Install [Foundry](https://github.com/foundry-rs/foundry) (you can get some ressources [here](https://book.getfoundry.sh/)).
2. Copy `example.env` to `.env` file at the root of your project and complete it with your own private keys.
3. Run these three commands:
```
source .env
forge install
forge test -vv
forge create --rpc-url "https://goerli.infura.io/v3/f1bed5a8674b48cdad93d8f6c69e7201" \   
--constructor-args "0xc1C6805B857Bef1f412519C4A842522431aFed39" \
--private-key blabla \
src/Abstraction.sol:SmartGhoTx --etherscan-api-key "IZVZKTEUYYTTQVI8T41M5S69XHQV457HFD" --verify
```


Working implementation of the onchain creation of an userOp, that will be executed by a call from a gelato node and that will be paid with GHO tokens.