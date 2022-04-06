// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint256 public totalSupply;
    address public owner;
    // Maps user address to its balance
    mapping(address => uint256) public balances;
    // Maps user address to an array of Payment struct
    mapping(address => Payment[]) public payments;
    struct Payment {
        uint256 amount;
        address recipient;
    }

    event ChangeSupply(uint256 supply);
    event Transfer(uint256 amount, address recipient);

    constructor() {
        owner = msg.sender;
        totalSupply = 1000;
        balances[owner] = totalSupply;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function viewTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function increaseSupply() public onlyOwner {
        totalSupply += 1000;
        emit ChangeSupply(totalSupply);
    }

    function transfer(address _recipient, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance.");
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
        payments[msg.sender].push(Payment(_amount, _recipient));
        emit Transfer(_amount, _recipient);
    }
}
