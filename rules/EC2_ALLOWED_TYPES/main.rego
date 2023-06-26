package rules.EC2_ALLOWED_TYPES

import data.snyk

input_type := "tf"

metadata := {
	"id": "EC2_ALLOWED_TYPES",
	"severity": "high",
	"title": "Using a Non-Allowed Instance Type",
	"description": "Using a Non-Allowed Instance Type",
	"product": [
		"iac",
		"cloud",
	],
}
allowed_types := {
    "t2.small",
    "t2.medium",
    "t2.large"
}

ec2_insts = snyk.resources("aws_instance")

deny[info] {
	ec2_inst := ec2_insts[_]
	not allowed_types[ec2_inst.instance_type]
	info := {"resource": ec2_inst}
}


resources[info] {
	ec2_inst := ec2_insts[_]
	info := {"resource": ec2_inst}
}