// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {ERC1967Utils} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol";

contract UpgradeBox is Script {

    function run() external returns (address proxy) {
        address getMostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);
        vm.startBroadcast();
        BoxV2 newBox = new BoxV2();
        vm.stopBroadcast();

        proxy = upgradeBox(getMostRecentlyDeployed, address(newBox));
    }

    /**
     * @param proxyAddress The proxyAddress that points to an implementation
     * @param newBox Address of new implementation that you want the proxy to point to
     */
    function upgradeBox(address proxyAddress, address newBox) public returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(proxyAddress);

        /**
         * @dev Proxy contracts now points to the new address
         */
        proxy.upgradeToAndCall(payable(address(newBox)), "");
        vm.stopBroadcast();

        return address(proxy);
    }
}
