// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity 0.8.14;

import "forge-std/Script.sol";
import { DeploySetting } from "./libraries/DeploySetting.sol";
import { LibDeploy } from "./libraries/LibDeploy.sol";

contract DeployPaymaster is Script, DeploySetting {
    function run() external {
        _setDeployParams();
        vm.startBroadcast();

        if (
            block.chainid == DeploySetting.BASE_GOERLI ||
            block.chainid == DeploySetting.BASE
        ) {
            LibDeploy.deployPaymaster(
                vm,
                deployParams.deployerContract,
                deployParams.entryPoint,
                deployParams.protocolOwner,
                deployParams.backendSigner
            );
        }
        vm.stopBroadcast();
    }
}