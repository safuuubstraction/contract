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
        new SmartGhoTx(vm.envAddress("OPS_GOERLI"));
        
        vm.stopBroadcast();
    }
}