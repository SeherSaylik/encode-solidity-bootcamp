// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VolcanoCoin is Ownable, ERC20 {
    event ChangeSupply(uint256 supply);
    mapping(address => Payment[]) public payments;
    struct Payment {
        uint256 amount;
        address recipient;
    }

    constructor() ERC20("Volcano", "VLC") {
        _mint(msg.sender, 1000);
    }

    function increaseSupply() public onlyOwner {
        address owner = _msgSender();
        _mint(owner, 1000);
        uint256 totalSupply = totalSupply();
        emit ChangeSupply(totalSupply);
    }

    function _transfer(address _recipient, uint256 _amount) public {
        transfer(_recipient, _amount);
        payments[msg.sender].push(Payment(_amount, _recipient));
    }
}
