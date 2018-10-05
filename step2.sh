#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh
#DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "
PROMPT_TIMEOUT=0
# hide the evidence
clear


pe "kubectl get rs"
pe "kubectl get pods"
pe "kubectl describe deployment nginx"
pe "kubectl rollout history deployment/nginx"
pe "kubectl rollout undo deployment/nginx"
pe "kubectl describe deployment/nginx"
