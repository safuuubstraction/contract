// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {ERC4626} from "@solmate/mixins/ERC4626.sol";
import {IOrderExecutor} from "./IOrderExecutor.sol";

struct OrderDatas {
    address user;
    uint256 price;
    uint256 amount;
    address strategyVaultAddress;
    address tokenOut;
    bytes32 orderId;
    bool isExecuted;
}

interface IOrderBook {
    event construct(string, address);
    event orderCreated(string, uint256);

    function setOrderExecutor(IOrderExecutor _orderExecutorAddress) external;

    function setStrategiesVault(address _strategiesVaultAddress) external;

    function createOrder(address user, uint price, uint amount, ERC4626 _strategyVault, address _tokenOut) external returns (uint);

    function getOrder(uint _orderNonce) external view returns (OrderDatas memory);

    function cancelOrder(uint _orderNonce) external;
    
    function setExecuted(uint _orderNonce) external;

    function getExecutorAddress() external view returns (address);

}


