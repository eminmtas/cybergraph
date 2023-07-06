// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity 0.8.14;

import "forge-std/Script.sol";
import { DeploySetting } from "./libraries/DeploySetting.sol";
import { LibDeploy } from "./libraries/LibDeploy.sol";

contract DeployMw is Script, DeploySetting {
    function run() external {
        _setDeployParams();
        vm.startBroadcast();

        if (
            block.chainid == DeploySetting.MUMBAI ||
            block.chainid == DeploySetting.BASE_GOERLI
        ) {
            LibDeploy.deployMw(
                vm,
                deployParams.deployerContract,
                address(0x9C7f8e6284Cf8999F04A51e5dd44ff5ED91fEE76),
                address(0x3De80b44fC15fc0376F0Ba0Ae9CE53A261c03B56)
            );
        }
        vm.stopBroadcast();
    }
}
