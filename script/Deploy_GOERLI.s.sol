// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "@forge-std/Script.sol";
import {SmartGhoTx} from "../src/Abstraction.sol";

contract DeployScript is Script {
    //function setUp() public {}

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy SmartGhoTx
        new SmartGhoTx(vm.envAddress("OPS_GOERLI"), 0x99cFF72E1899a65457d20b845952d9C1AEa4a25A);
        
        vm.stopBroadcast();
    }
}