locals {
  task_def_environment = [
    {
      name  = "LEDGER_CANISTER_ID"
      value = "zcpc2-4qaaa-aaaaj-qaula-cai"
    },
    {
      name  = "LOG_LEVEL"
      value = "DEBUG"
    },
    {
      name  = "TOKEN"
      value = "OGY"
    }
  ]
}