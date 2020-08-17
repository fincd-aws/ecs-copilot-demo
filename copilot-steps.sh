copilot init
# app name copilot-demo
# service name copilot-porcelain
# backend service
#deploy to test envirnment failed - MAX VPCs in us-west-2
# export AWS_DEFAULT_REGION
copilot app init --resource-tags autodelete=2mo
# failed, b/c it tried to remake the copilot-demo-infrastructure-roles stack, which was CREATE_COMPLETE in us-west-2. Seems like this would be the one good use of Exports...
copilot svc init -a copilot-demo -n copilot-porcelain -d ./Dockerfile -t 'Backend Service'
# each env can be in a seperate region, so actually I could have reused the infra-roles stack in us-west-2, oh well
copilot env init -n test --region us-east-2 --default
copilot svc deploy --name copilot-porcelain --env test
