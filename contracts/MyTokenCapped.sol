pragma solidity ^0.8.0; // best to use the same version of contract we are inheriting from

// this token is an ERC20 token with a max supply and ownable functionality

//imports from the node_modules folder the erc20capped contract
import "../node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

// contract code (from OpenZeppelin) for ERC20.sol, ERC20Capped.sol and Ownable.sol respectively
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Capped.sol
//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

/*
    This is the constructor in the ERC20.sol openzeppelin contrtact;
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    constructor for the ERC20Capped.sol
    constructor(uint256 cap_) {
        require(cap_ > 0, "ERC20Capped: cap is 0");
        _cap = cap_;
    }

    hence, we also need to make such a constructor in our inherited contract
    i.e. in MyToken too
    after deploying, we can use all the functions from the ERC20.sol file
    such as symbol, balanceOf,totalSupply, etc...

    Note: if we look into the ERC20Capped.sol file, we will see that ERC20Capped is ERC20;
    meaning that ERC20Capped inherited ERC20; hence, we don't need to inherit ERC20 again.
    Instead, we just inherit ERC20Capped and we will have all functionalities of ERC20Capped & ERC20
    But, we wil lalso have to do both constructors

    Note: we don't have to put ownable in the constructor because in the code for Ownable.sol,
    there is no params in the constructor for it. 

    Now, instead of just having an ERC20 (MyToken) we now an ERC20 (MyTokenCapped) 
    which has a max supply and ownable functionality

    The ownable.sol contract gives access to onlyOwner modifier and also ensures that
    the deployer of the contract (accounts[0] in this case) is the "owner" of the contract

*/

contract MyTokenCapped is ERC20Capped, Ownable {
    constructor() ERC20("MyTokenCapped", "MTKC") ERC20Capped(10000) {
        // note: we removed the mint function because of an error it is causing from ERC20Capped.sol
    }

    // we have to manually create a public mint function because the _mint function
    // in ERC20 contract from openzeppelin is internal; meaning we can't just call instance._mint
    // on the contract; hence we make a function mintTokens so that we can interact with the _mint function
    // since internal functions can only be accessed by the contract which inherited it; or within the own contract
    // we also use the onlyOwner modifier which is from the Ownable.sol
    function mintTokens(address _address, uint256 _amount) public onlyOwner {
        _mint(_address, _amount);
    }
}
