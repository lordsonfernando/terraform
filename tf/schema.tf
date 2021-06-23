# locals {
#   schemadata = tomap(jsondecode(file(var.schemafile)))
#   bqschemadata = { 
#       for k, v in local.schemadata : k => "STRING" if v == "string"
#   }
#   pubsubschema=templatefile("schema.tpl",{ type = "pubsub" , data = local.schemadata})
#   bqsubschema=templatefile("schema.tpl",{ type = "bq" , data = local.bqschemadata})
# }