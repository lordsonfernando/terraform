%{ if type == "pubsub" }
${jsonencode(
  {
    "type" : "record",
    "name" : "Avro",
    "fields": [for config_key, config_value in data : {"name":"${config_key}","type":"${config_value}"}],
  }
)}
%{ endif }

%{ if type == "bq" }
${jsonencode(
[ for config_key, config_value in data : 
  {
    "name": "${config_key}",
    "type": "${config_value}",
    "mode": "NULLABLE",
    "description": "${config_key}"
  }
])}
%{ endif }