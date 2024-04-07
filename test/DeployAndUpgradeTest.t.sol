// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {Test} from "forge-std/Test.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";

contract DeployAndUpgradeTest is Test {

    address public proxy;

    DeployBox public deployer;
    UpgradeBox public upgrader;
    address public alice = makeAddr("alice");

    function setUp() public {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxy = deployer.run();
        deal(alice, 10 ether);
    }    

    function testUpgrades() public {
        BoxV2 v2 = new BoxV2();
        upgrader.upgradeBox(proxy, address(v2));
        uint256 expectedVersion = 2;
        assertEq(expectedVersion, BoxV2(proxy).version());
        BoxV2(proxy).setNumber(7);
        assertEq(7, BoxV2(proxy).getNumber());
    }


}