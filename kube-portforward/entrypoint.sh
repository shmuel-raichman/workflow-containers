# B"H

# Source env
source env.sh

# dev:central
kubectl port-forward -n default svc/demo-lab-service "9000:8080" --context $DEV_CENTRAL_CTX --address='0.0.0.0' &
kubectl port-forward -n argocd svc/argocd-server "9001:80" --context $DEV_CENTRAL_CTX --address='0.0.0.0' &

# # dev:west
kubectl port-forward -n dev-apps svc/demo-lab-service "8000:8080" --context $DEV_WEST_CTX --address='0.0.0.0' &
kubectl port-forward -n argocd svc/argocd-server "8001:80"  --context $DEV_WEST_CTX --address='0.0.0.0'