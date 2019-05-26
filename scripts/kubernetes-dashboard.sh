#######################################################################################################################################
#                                           CREATING THE DASHBORAD SERVICE                                                            #
#######################################################################################################################################

#Ref https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

# Create dashboard with Nodeport

kubectl apply -f https://raw.githubusercontent.com/nethjai/dashboard/node-port-dashboard/aio/deploy/recommended/kubernetes-dashboard.yaml

#Creating service account steps

kubectl create serviceaccount dashboard -n default

kubectl create clusterrolebinding dashboard-admin -n default \
--clusterrole=cluster-admin \
--serviceaccount=default:dashboard
sleep 1m
kubectl get pods -o wide --all-namespaces
sleep 1m
kubectl get svc --all-namespaces

kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode


