#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh
#DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "
PROMPT_TIMEOUT=0
# hide the evidence
clear

pe "mkdir /Users/$(whoami)/conf.d"
pe "cat > /Users/$(whoami)/conf.d/nginx-basic.conf << 'EOF'
server {
    location / {
        return 200 'Hello, world!';
        add_header Content-Type text/plain;
    }
}
EOF"
pe "kubectl create configmap basic-config --from-file=/Users/$(whoami)/conf.d"
pe "`eval` clear"
pe "kubectl get configmap -o yaml"
pe "cat > hello-world.yaml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: basic-pod
spec:
  containers:
  - name: basic
    image: nginx
    volumeMounts:
    - name: basic-config
      mountPath: /etc/nginx/conf.d
  volumes:
    - name: basic-config
      configMap:
        name: basic-config
EOF"

pe "kubectl create -f hello-world.yaml"
pe "kubectl get pods"
pe "kubectl exec -i -t basic-pod -- bash"
