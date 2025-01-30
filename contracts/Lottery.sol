// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Lottery {
    address[] public players;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function enter() public payable {
        require(msg.value >= 0.01 ether, "Minimum 0.01 ETH to enter");
        players.push(msg.sender);
    }

    function pickWinner() public {
        require(msg.sender == owner, "Only owner can pick a winner");
        require(players.length > 0, "No players in the lottery");

        uint256 winnerIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, players.length))) % players.length;
        payable(players[winnerIndex]).transfer(address(this).balance);

        delete players; // Reset lottery
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }
}
