#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh
#DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "
PROMPT_TIMEOUT=0
# hide the evidence
clear

# Put your stuff here
pe "kubectl run nginx --image=stenote/nginx-hostname --record=true"
pe "kubectl get deployments,rs"
pe "kubectl scale deployment/nginx --replicas=2"
pe "kubectl get pods"
pe "kubectl expose deployment nginx --port 80 --target-port 80 --type=LoadBalancer --name=nginx-http"
pe "kubectl describe service nginx-http"
#pe "`eval `curl $(kubectl get svc/nginx-http -o go-template --template='{{(index .status.loadBalancer.ingress 0).hostname}}')``"
#pe "kubectl set image deployment/nginx nginx=nginx:1.91"
#pe "kubectl rollout status deployment nginx"
