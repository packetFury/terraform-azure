resource "azurerm_cosmosdb_account" "cosmos" {
    # checkov:skip=CKV_AZURE_206: "Replication not needed: data is of negligible importance"
    name                = var.cosmos_account_name
    location            = var.location
    resource_group_name = var.resource_group_name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"

    access_key_metadata_writes_enabled = false #Pass CKV_AZURE_132
    local_authentication_disabled = true #Pass CKV_AZURE_140

    free_tier_enabled   = true

    consistency_policy {
        consistency_level = "Session"
    }

    geo_location {
        location            = var.location
        failover_priority   = 0
    }
}

resource "azurerm_cosmosdb_sql_database" "db" {
    name                = "PortfolioDB"
    resource_group_name = var.resource_group_name
    account_name        = azurerm_cosmosdb_account.cosmos.name
}

resource "azurerm_cosmosdb_sql_container" "counter" {
    name                = "VisitorCounter"
    resource_group_name = var.resource_group_name
    account_name        = azurerm_cosmosdb_account.cosmos.name
    database_name       = azurerm_cosmosdb_sql_database.db.name
    partition_key_paths  = ["/id"]
}