// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Vault.sol";

contract Bank is Vault {
    event Withdrawn (address indexed user, uint amount);
    
    modifier onlyOwner(){
        require(msg.sender == owner,'Only the owner can call withdraw.');
        _;
    }

    function withdraw (uint amount) public onlyOwner{
        require(amount <= sentValue, "Insufficient balance in Vault.");
        sentValue -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }
    // function withdraw(uint amount) public onlyOwner{
    //     require(amount <= sentValue, "Insufficient balance in Vault.");
    //     sentValue -= amount;
    //     payable(msg.sender).transfer(amount);
    //     emit Withdrawn(msg.sender, amount);
    // }
}
