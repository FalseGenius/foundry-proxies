// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract UpgradeBox is Script {

    function run() external returns (address) {
        address getMostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BoxV1", block.chainid);
        
    }
}
