eksctl create cluster \
--name capsproj \
--region us-east-2a \
--node-type t2.small \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--managed

eksctl get cluster --name=capstone


