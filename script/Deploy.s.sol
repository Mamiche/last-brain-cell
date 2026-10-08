// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {LastBrainCell} from "../src/LastBrainCell.sol";

interface ScriptVm {
    function envAddress(string calldata name) external view returns (address);
    function startBroadcast() external;
    function stopBroadcast() external;
}

contract Deploy {
    ScriptVm private constant vm = ScriptVm(address(uint160(uint256(keccak256("hevm cheat code")))));

    function run() external returns (LastBrainCell token) {
        address initialHolder = vm.envAddress("INITIAL_HOLDER");
        require(initialHolder != address(0), "INITIAL_HOLDER is zero");

        vm.startBroadcast();
        token = new LastBrainCell(initialHolder);
        vm.stopBroadcast();
    }
}
