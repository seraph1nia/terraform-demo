#!/usr/bin/env python
from constructs import Construct
from cdktf import App, NamedRemoteWorkspace, TerraformStack, TerraformOutput, RemoteBackend, Fn
from cdktf_cdktf_provider_aws.provider import AwsProvider
from cdktf_cdktf_provider_aws.instance import Instance
from cdktf_cdktf_provider_aws.data_aws_ami_ids import DataAwsAmiIds, DataAwsAmiIdsFilter, DataAwsAmiIdsConfig

class cdktfDemo(TerraformStack):
    def __init__(self, scope: Construct, id: str):
        super().__init__(scope, id)

        # provider
        AwsProvider(self, "AWS")

        # ami filter
        ami_filter = DataAwsAmiIdsFilter(
            name   = "name",
            values = ["amzn-ami-hvm-*-x86_64-gp2"]
        )

        ami = DataAwsAmiIds(self, "ami-id's",
            filter=[ami_filter],
            owners=["amazon"],
        )

        # ec2
        instance = Instance(self, "compute",
                            ami=Fn.element(ami.ids, 0),
                            instance_type="t2.micro",
                            tags={
                                "Name": "cdktf-demo",
                            }
                            )

        # terraform output
        TerraformOutput(self, "public_ip",
                        value=instance.public_ip,
                        )

app = App()
cdktfDemo(app, "cdktf-demo")

app.synth()
