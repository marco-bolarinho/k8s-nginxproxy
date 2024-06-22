# StorageClass

---

With StorageClass attached to an EFS we can easily deploy pvc's and associate them with a mountPath.

**It is necessary to install CSI driver, for aws efs click [here](https://docs.aws.amazon.com/eks/latest/userguide/efs-csi.html).**

### StorageClass example:
```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: efs-sc
provisioner: efs.csi.aws.com
parameters:
  provisioningMode: efs-ap
  fileSystemId: fs-0bb1ccaf524091a8e
  directoryPerms: "700" # permissions
  gidRangeStart: "1000" # optional - group ids that can be assigned
  gidRangeEnd: "2000" # optional - group ids that can be assigned
  basePath: "/data" # optional
  subPathPattern: "${.PVC.namespace}/${.PVC.name}"
  ensureUniqueDirectory: "true" # optional
  reuseAccessPoint: "false" # optional
```

### PersistentVolumeClaim example:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: <pvc name>
spec:
  accessModes:
    - <access mode [ReadWriteOnce, ReadOnlyMany, ReadWriteMany]>
  storageClassName: <storage class name>
  selector:  # Optional: Use label selectors to match existing PVs
    matchLabels:
        release: "stable"
        tier: "web"
  resources:
    requests:
      storage: <amount of storage [Gi]>
  volumeMode: Filesystem   # Optional Volume mode: Filesystem (default) or Block
  volumeName: my-pv       # Optional: Claim a specific PV by name
```

### PersistentVolumeClaim association example (simplified):
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postgres
  template:
    spec:
      containers:
        - name: postgres
          image: 'bitnami/postgresql'
          ports:
            - containerPort: 5432
          volumeMounts:
            - mountPath: /bitnami/postgresql
              name: postgresdata
      volumes:
        - name: postgresdata
          persistentVolumeClaim:
            claimName: postgres-pvc # name of the pvc
```