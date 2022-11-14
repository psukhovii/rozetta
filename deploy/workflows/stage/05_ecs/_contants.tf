locals {
  task_def_environment = [
    {
      "name" : "LOG_LEVEL",
      "value" : "DEBUG"
    },
    {
      "name" : "LEDGER_CANISTER_ID",
      "value" : "qswkt-jqaaa-aaaak-qaj3a-cai"
    },
    {
      "name" : "IC_URL",
      "value" : "https://mainnet.dfinity.network"
    },
    {
      "name" : "TOKEN",
      "value" : "OGY"
    }
  ]
}