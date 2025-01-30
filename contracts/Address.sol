// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract Address {
    address myAdress;

    function setMyAdress(address _myAdress) external {
        myAdress = _myAdress;
    }

    function getBalance() external view returns (uint256) {
        return myAdress.balance;
    }

    function getBalanceOfAddress(address _address) external view returns (uint256) {
        return _address.balance;
    }   

    //Function to send Ether to an address (No revert on failure)
    function sendToAddress(address payable _to) external payable {
        require(address(this).balance >= msg.value, "Insufficient balance");
        bool success = _to.send(msg.value);
        require(success, "Send failed");
    }

    //Function to transfer Ether to an address (Revert on failure)
    function transferToAddress(address payable _to) external payable {
        require(address(this).balance >= msg.value, "Insufficient balance");
        _to.transfer(msg.value);
    }

    //Function to call a function in another contract and send Ether
    function callToAddress(address payable _to) external payable {
        require(address(this).balance >= msg.value, "Insufficient balance");
        (bool success, ) = _to.call{value: msg.value}("");
        require(success, "Call failed");
    }

    //Function to send Ether to this contract
    function giveMoneyToThisContract() external payable {
        //Do nothing
    }

    // Fallback function to receive Ether
    receive() external payable {}

    fallback() external payable {}

}