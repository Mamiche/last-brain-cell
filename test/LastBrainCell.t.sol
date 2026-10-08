// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {LastBrainCell} from "../src/LastBrainCell.sol";

interface Vm {
    function prank(address caller) external;
    function expectRevert() external;
}

contract LastBrainCellTest {
    Vm private constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));
    uint256 private constant EXPECTED_SUPPLY = 1_000_000_000 * 10 ** 18;

    function testMetadataAndInitialSupply() public {
        LastBrainCell token = new LastBrainCell(address(this));

        require(keccak256(bytes(token.name())) == keccak256("Last Brain Cell"), "wrong name");
        require(keccak256(bytes(token.symbol())) == keccak256("BRAIN"), "wrong symbol");
        require(token.decimals() == 18, "wrong decimals");
        require(token.totalSupply() == EXPECTED_SUPPLY, "wrong total supply");
        require(token.balanceOf(address(this)) == EXPECTED_SUPPLY, "wrong initial holder balance");
    }

    function testTransfer() public {
        LastBrainCell token = new LastBrainCell(address(this));
        address recipient = address(0xBEEF);
        uint256 amount = 25 * 10 ** 18;

        require(token.transfer(recipient, amount), "transfer failed");
        require(token.balanceOf(recipient) == amount, "recipient balance mismatch");
    }

    function testTransferFromConsumesAllowance() public {
        LastBrainCell token = new LastBrainCell(address(this));
        address spender = address(0xCAFE);
        address recipient = address(0xBEEF);
        uint256 amount = 10 * 10 ** 18;

        token.approve(spender, amount);
        vm.prank(spender);
        require(token.transferFrom(address(this), recipient, amount), "transferFrom failed");
        require(token.balanceOf(recipient) == amount, "recipient balance mismatch");
        require(token.allowance(address(this), spender) == 0, "allowance not consumed");
    }

    function testCannotMintToZeroAddress() public {
        vm.expectRevert();
        new LastBrainCell(address(0));
    }
}
