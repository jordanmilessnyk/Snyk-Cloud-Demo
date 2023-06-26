package rules.ALLOCATED_STORAGE

import data.snyk

input_type := "tf"

metadata := {
	"id": "ALLOCATED_STORAGE",
	"severity": "medium",
	"title": "Minimum Storage Allocation Not Met",
	"description": "Allocate the minimum required storage",
	"product": [
		"iac",
		"cloud",
	],
}
db_instances := snyk.resources("aws_db_instance")

deny[info] {
	db_inst := db_instances[_]
    not db_inst.allocated_storage < 20
    info := {"resource": db_inst}
}

resources[info] {
	db_inst := db_instances[_]
	info := {"resource": db_inst}
}