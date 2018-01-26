#create-key-pair
aws ecs create-key-pair --key-name MyAppKey \
	                --query 'KeyMaterial' \
                        --output text > ~/.ssh/MyApp.pem

