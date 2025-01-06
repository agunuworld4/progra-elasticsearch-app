#HELM INSTALLATION
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

sleep 30
#clone repo on server
git clone git@github.com:agunuworld4/pgrykubernetes-ingress.git
#sleep 10
#git checkout
#
#cd kubernetes-ingress/deployments
sleep 10
## 2. Create a Namespace And SA
kubectl apply -f kubernetes-ingress/deployments/common/ns-and-sa.yaml

sleep 10
##
kubectl apply -f kubernetes-ingress/deployments/common/

sleep 10
### 4. Deploy the Ingress Controller
#DaemonSet*. Use a DaemonSet for deploying the Ingress controller on every node or a subset of nodes.
kubectl apply -f kubernetes-ingress/deployments/daemon-set/nginx-ingress.yaml

sleep 10
#For AWS, run:
kubectl apply -f kubernetes-ingress/deployments/service/loadbalancer-aws-elb.yaml

#get the DNS name of the ELB, run
kubectl describe svc nginx-ingress --namespace=nginx-ingress

kubectl get svc -n nginx-ingress
