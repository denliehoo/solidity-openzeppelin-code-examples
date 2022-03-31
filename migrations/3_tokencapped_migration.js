const MyTokenCapped = artifacts.require("MyTokenCapped");

module.exports = function (deployer) {
  deployer.deploy(MyTokenCapped);
};

/* 
truffle develop
truffle compile
truffle migrate

let instance = await MyTokenCapped.deployed()

instance.symbol() // shows token symbol

instance.owner() // shows the owner of the contract 


// mints token
// this will work since the deployer (accounts[0]) by default is the owner and only owner can mint
instance.mintTokens(accounts[0],1000,{from: accounts[0]})
// this won't work since accounts[1] is not the owner
instance.mintTokens(accounts[0],1000,{from: accounts[1]})


// shows the balance of the first account; note: first account is the one
// which deploys the contract by default
let result = await instance.balanceOf(accounts[0])
result.toNumber()

Note: if we just see result, it will be a BN (big number which is a javascript
  library for number which truffle uses to handle numbers more precisely)
  hence, we do a .toNumber() to convert it to a human readable number


// attempt to mint more tokens
instance.mintTokens(accounts[0],10000,{from: accounts[0]})
// that wouldn't work either because the max supply is 10,000 , and if we mint another 10,000
// then total amount would be 11,000, which exceeds the amount; hence will throw an error and revert




*/