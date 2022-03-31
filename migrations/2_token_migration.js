const MyToken = artifacts.require("MyToken");

module.exports = function (deployer) {
  deployer.deploy(MyToken);
};

/* 
truffle develop
truffle compile
truffle migrate

let instance = await MyToken.deployed()

instance.symbol() // shows token symbol

// shows the balance of the first account; note: first account is the one
// which deploys the contract by default
let result = await instance.balanceOf(accounts[0])
result.toNumber()

Note: if we just see result, it will be a BN (big number which is a javascript
  library for number which truffle uses to handle numbers more precisely)
  hence, we do a .toNumber() to convert it to a human readable number

*/