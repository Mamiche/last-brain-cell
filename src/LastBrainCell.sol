// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LastBrainCell is ERC20 {
    uint256 public constant INITIAL_SUPPLY = 1_000_000_000 * 10 ** 18;

    constructor(address initialHolder) ERC20("Last Brain Cell", "BRAIN") {
        _mint(initialHolder, INITIAL_SUPPLY);
    }
}
