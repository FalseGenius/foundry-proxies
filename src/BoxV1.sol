// SPDX-License-Identifier: MIT

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ERC20Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";


pragma solidity ^0.8.18;

/**
 * @notice Proxy contracts do not have constructors.
 * Constructors add storage to implementation. Initializers are esentially constructors
 * for proxy.
 */

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable, ERC20Upgradeable {

    error BoxV1__YouAreNotTheOwner();

    uint256 internal number;

        /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /**
     * @dev This is upgradeable/initializable function. It sets owner to msg.sender.
     */
    function initialize() public initializer {
        __Ownable_init(msg.sender);
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}