package rules.EC2_ALLOWED_TYPES

import data.snyk

input_type := "tf"

metadata := {
	"id": "EC2_ALLOWED_TYPES",
	"severity": "high",
	"title": "Instance Type Not Allowed",
	"description": "Please choose an allowed EC2 instance type",
	"product": [
		"iac",
		"cloud",
	],
}

ec2_insts := snyk.resources("aws_instance")


allowed_versions := {
    "t2.small",
    "t2.medium",
    "t2.large"

}

deny[info] {
	ec2_inst := ec2_insts[_]
    not allowed_versions[ec2_inst.instance_type]
    info := {"resource": ec2_inst}
}

resources[info] {
	ec2_inst := ec2_insts[_]
	info := {"resource": ec2_inst}
}