pragma solidity ^0.8.0; // best to use the same version of contract we are inheriting from

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol"; //imports from the node_modules folder the erc20 contract

/*
    This is the constructor in the ERC20.sol openzeppelin contrtact;
    hence, we also need to make such a constructor in our inherited contract
    i.e. in MyToken too
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    after deploying, we can use all the functions from the ERC20.sol file
    such as symbol, balanceOf,totalSupply, etc...
*/

contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK") {
        // this mint function is from the ERC20.sol contract (optional to do this)
        _mint(msg.sender, 1000);
    }
}
