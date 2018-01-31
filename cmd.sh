//allocate-address
aws es2 allocate-address

//associate-address
aws ec2 associate-address --allocation eipalloc-xxxx \
	                  --instance i-xxxxxx

//authorize-secutiry-group-ingress
aws ec2 authorize-security-group-ingress --group-name "MyApp" \
	                                 --ip-permissions '[{"IpProtocol": "tcp",
					                     "FromPort": 80,
						             "ToPort": 80,
						             "IpRanges": [{"CidrIp": "0.0.0.0/0"}] },
							    {"IpProtocal": "tcp",
							     "FromPort": 22,
						             "ToPort": 22,
						             "IpRanges": [{ "CidrIp": "0.0.0.0/0" }] }]'

//create-image

//create-key-pair

//create-security-group

//create-stack

//delete-stack

//run-instances

//update-stack


