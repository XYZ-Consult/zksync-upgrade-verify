// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title UpgradeTest
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract UpgradeTest {

   struct Call {
        address target;
        uint256 value;
        bytes data;
    }

    struct UpgradeProposal {
        Call[] calls;
        address executor;
        bytes32 salt;
    }

    Call[] calls;

    function setCalls() public {
        delete calls;
        calls.push(Call(0x9b956d242e6806044877c7c1b530d475e371d544, 0, hex"0x691616c5000000000000000000000000e95141dd86828d23c2aa8ed518644af5e4216d79"));
    }

    function see() public view returns (bytes32) {
        UpgradeProposal memory proposal = UpgradeProposal(calls, 0x0000000000000000000000000000000000000000, 0x3240000000000000000000000000000000000000000000000000000000000324);
        return keccak256(abi.encode(proposal));
    }
}
