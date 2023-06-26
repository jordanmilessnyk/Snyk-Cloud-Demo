package rules.ALLOCATED_STORAGE

import data.snyk

input_type := "tf"

metadata := {
	"id": "ALLOCATED_STORAGE",
	"severity": "medium",
	"title": "Please Allocate Required Storage",
	"description": "Allocated Storage Does Not Meet Requirements",
	"product": [
		"iac",
		"cloud",
	],
}

db_insts := snyk.resources("aws_db_instance")


deny[info] {

	db_inst := db_insts[_]
	not db_inst.allocated_storage > 10
	info := {"resource": db_inst}
}

resources[info] {
	db_inst := db_insts[_]
	info := {"resource": db_inst}
}
