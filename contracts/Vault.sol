// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Vault {

    address public owner;
    uint public sentValue;
    uint public timestamp;
    uint public gasUsed;

    constructor() {
        owner = msg.sender;
    }
    function deposit () public virtual payable {
        if (msg.value <= 0) {
            revert ("Must send some ether.");
        }
        sentValue = msg.value;
        timestamp = block.timestamp;
    }
    function getCaller() public view returns (address) {
        return msg.sender;
    }
    function getOrigin() public view returns (address) {
        return tx.origin;
    }
    function getBlockDetails() public view returns (uint, uint, uint, address) {
        return (block.number, block.prevrandao, block.gaslimit, block.coinbase);
    }
    function trackGasUsage() public {
        gasUsed =  tx.gasprice;
    }
    function generateHash(string memory input) public pure returns (bytes32){
        return keccak256(abi.encodePacked(input));
    }
    
}
