var infura_apikey = "QnfxPf19S2Zyd8b7HsDx";

var LedgerWalletProvider = require("truffle-ledger-provider");

var ledgerOptions = {
  networkId: 3,
  accountsOffset: 5
};

module.exports = {
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
      gas: 4000000,
      gasPrice: 1e8
    },
    ropsten: {
      provider: new LedgerWalletProvider(ledgerOptions, "https://ropsten.infura.io/" + infura_apikey),
      network_id: 3,
      gas: 4000000,
      gasPrice: 1e8
    }
  }
};
