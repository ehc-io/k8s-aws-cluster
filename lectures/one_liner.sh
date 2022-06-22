kubectl run frontend --image=nginx
kubectl run backend --image=nginx
echo "waiting pds to be created..."
sleep 6
kubectl get pods
kubectl expose pod backend --port 80
kubectl expose pod frontend --port 80
kubectl get pod,svc
kubectl exec frontend -- curl -s backend
kubectl exec backend -- curl -s frontend
#
kubectl create namespace dbspace --dry-run=client -o yaml | \
 sed  '/^metadata:/a\ \ labels: {"ns":"dbspace"}' | kubectl apply -f - 