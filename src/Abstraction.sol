// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {OpsTaskCreator} from "@gelato/integrations/OpsTaskCreator.sol";
import {ModuleData, Module} from "@gelato/integrations/Types.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract SmartGhoTx is OpsTaskCreator {
    address internal admin;
    uint public txId;
    //mapping(uint => bool) public executed;
    bool executed;


    modifier onlyAdmin {
        require(msg.sender == admin, "Not allowed address.");
        _; // Continue the execution of the function called
    }

    constructor(address _opsAddress) OpsTaskCreator(_opsAddress, address(this)) {
        admin = msg.sender;

    }

    function checker(/*uint256 _txId*/) public view returns (bool canExec, bytes memory execPayload) {
        canExec = true/*executed*//*[_txId]*/; // The condition that needs to be true for the tx to be executed
        execPayload = abi.encodeCall(this.executeUserOp, (/*_txId*/)); // The function that you want to call on the contract
    }

    function createUserOp() external returns (uint) {
        
        // The function that will be executed by the executor to execute this specific transaction
        bytes memory execData = abi.encodeCall(this.executeUserOp, (/*txId*/));

        // The modules that will be used to execute the tx
        ModuleData memory moduleData = ModuleData({
            modules: new Module[](3),
            args: new bytes[](3)
        });

        moduleData.modules[0] = Module.RESOLVER;
        moduleData.modules[1] = Module.PROXY;
        moduleData.modules[2] = Module.SINGLE_EXEC;

        // The resolver module will check if the tx is ready to be executed
        moduleData.args[0] = _resolverModuleArg(address(this), abi.encodeCall(this.checker, (/*txId*/)));
        // The proxy will be a whitelisted gelato node authorized to execute the tx
        moduleData.args[1] = _proxyModuleArg();
        // There will be only one execution of this tx
        moduleData.args[2] = _singleExecModuleArg();

        /*bytes32 txTaskId = */ops.createTask(
            address(this), // contract to execute
            execData, // function to execute
            moduleData, // modules to use
            0xdC25729a09241d24c4228f1a0C27137770cF363e // ETH address to pay for the execution
        );

        return txId++;
    }

    function executeUserOp(/*uint _txId*/) external onlyDedicatedMsgSender {
        // User op here
        IERC20(address(0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6)).approve(address(0x00), 1);

   
        // Pay the fees
        (uint256 fee, address feeToken) = _getFeeDetails();

        // Transfer the fee to the Gelato Network
        _transfer(fee, feeToken);
    }

    function execute(/*uint256 _txId*/) public {
        executed/*[_txId]*/ = true;
    }

}


