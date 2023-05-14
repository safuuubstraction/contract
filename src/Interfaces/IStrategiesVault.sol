// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

interface IStrategiesVault {

    function deposit(uint256 orderNonce) external;

    function withdraw(uint256 orderNonce) external returns (uint256);

}