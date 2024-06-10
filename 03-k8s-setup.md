https://github.com/jdmedeiros/k8s

ln -s /usr/local/bin/kubectl /usr/local/bin/k

export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/go/bin:/home/ec2-user/go/bin:/usr/local/bin


```
    1  sudo yum groupinstall 'Development Tools' -y
    2  clear
    3  git clone https://github.com/jdmedeiros/k8s
    4  cd k8s/
    5  git checkout original_v126_update 
    6  git pull
    7  ./0-install-kubernetes-tools 
    8  sudo reboot
    9  sudo nano /etc/profile
   10  source /etc/profile
   11  aws
   12  kubectl
   13  cd k8s/
   14  source ./1-create-aws-infrastructure 
   15  ./2-create-certificates 
   16  ./3-distribute-certificates 
   17  source ./4-kubernetes-conf-files-for-authentication 
   18  source ./5-data-encryption-config-and-key 
   19  cat 4-kubernetes-conf-files-for-authentication 
   20  ./6-bootstrap-etcd-cluster 
   21  source ./7-bootstrap-control-plane 
   22  ./8-RBAC-for-kubelet-authorization 
   23  ./9-kubernetes-frontend-load-balancer 
   24  source 10-bootstrap-worker-nodes 
   25  ./11-configure-kubectl-for-remote-access 
   26  ./12-provisioning-pod-network-routes 
   27  ./13-deploy-the-DNS-cluster-add-on 
   28  ./14-smoke-test 
   29  whereis kubectl
   30  ln -s /usr/local/bin/k /usr/local/bin/kubectl
   31  ln -s /usr/local/bin/kubectl /usr/local/bin/k
   32  sudo ln -s /usr/local/bin/kubectl /usr/local/bin/k
   33  k
   34  k 
   35  k get
   36  k get all
   37  k get deployments.apps
   38  nano flask-deployment-nodeport.yaml 
   39  ./flask-deployment-nodeport 
   40  k get all -o w
   41  k get all -o wde
   42  k get all -o wide
   43  cat flask-deployment-
   44  cat flask-deployment-nodeport
   45  nano flask-deployment-nodeport.yaml 
   46  nano flask-deployment-nodeport 
   47  nano flask-deployment-nodeport.yaml 
   48  k 
   49  k get
   50  k get all -o wide
   51  k delete deployments.app/flask-nodeport
   52  k get all -o wide
   53  ./flask-deployment-nodeport 
   54  k get all -o wide
   55  k get deployments.apps
   56  k get all
   57  cat /etc/profile
   58  ls -l
   59  ls -la
   60  ls -la /usr/local/bin
   61  cfssl
   62  k get all -o wide
   63  nano flask-deployment-nodeport
   64  nano flask-deployment-nodeport.yaml 
   65  k
   66  k get all
   67  k get all -o wide
   68  history
   69  nano /etc/profile
   70  k get all
   71  k get 
   72  k get all -o wide
   73  k get all
   74  ss -tlnp
   75  history
   76  cd k8s/
   77  ls
   78  git status
   79  git pull
   80  ls -lç
   81  ls -l
   82  history
```

kubectl get [all|service|deployment] [all|name]

## Notes

* If a service is available, any worker's ip will return the service, even if the service is not present in that worker.
* 
