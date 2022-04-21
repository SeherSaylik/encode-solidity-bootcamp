// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VolcanoCoin is Ownable, ERC20 {
    event ChangeSupply(uint256 supply);
    mapping(address => Payment[]) public payments;
    struct Payment {
        address sender;
        address recipient;
        uint256 amount;
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
        recordPayment(msg.sender, _recipient, _amount);
    }

    function recordPayment(
        address _sender,
        address _recipient,
        uint256 _amount
    ) internal {
        payments[_sender].push(Payment(_sender, _recipient, _amount));
    }
}
