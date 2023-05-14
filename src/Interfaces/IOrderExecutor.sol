// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

interface IOrderExecutor {

    event OrderDone(string, uint256);

    function setPrice(uint _price) external;

    // Used to be funded in native token
    receive() external payable;

    function setStrategiesVault(address _strategiesVaultAddress) external;

    function checker(uint orderNonce) external view returns (bool canExec, bytes memory execPayload);

    function price() external view returns (uint);

    function executeOrder(uint orderNonce) external;

}
