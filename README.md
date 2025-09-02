## kubernetes 安装

```bash
# 装docker
curl -fsSL https://test.docker.com -o test-docker.sh
sh test-docker.sh
# 装依赖
apt-get install socat conntrack -y

# 部署
export KKZONE=cn
curl -sfL https://get-kk.kubesphere.io | VERSION=v3.0.7 sh -
echo yes|./kk create cluster --with-kubernetes v1.21.5


# 查看污点
kubectl get nodes -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints 
# 去污点
# 如果是单节点k8s，需要取消污点，保障业务pod可以调度（node_name 是 kubectl get node 返回的节点名称）
kubectl get node 
kubectl taint nodes ${node_name} node-role.kubernetes.io/master:NoSchedule-
```

### 需要的镜像

```bash
registry.cn-beijing.aliyuncs.com/kubesphereio/pause:3.4.1
registry.cn-beijing.aliyuncs.com/kubesphereio/kube-apiserver:v1.21.5
registry.cn-beijing.aliyuncs.com/kubesphereio/kube-controllers:v3.23.2
registry.cn-beijing.aliyuncs.com/kubesphereio/kube-controller-manager:v1.21.5
registry.cn-beijing.aliyuncs.com/kubesphereio/kube-scheduler:v1.21.5
registry.cn-beijing.aliyuncs.com/kubesphereio/kube-proxy:v1.21.5
registry.cn-beijing.aliyuncs.com/kubesphereio/coredns:1.8.0
registry.cn-beijing.aliyuncs.com/kubesphereio/k8s-dns-node-cache:1.15.12
registry.cn-beijing.aliyuncs.com/kubesphereio/cni:v3.23.2
registry.cn-beijing.aliyuncs.com/kubesphereio/node:v3.23.2
registry.cn-beijing.aliyuncs.com/kubesphereio/pod2daemon-flexvol:v3.23.2

```

## kubesphere 安装

### 1. 创建存储配置

KubeSphere 需要默认的 StorageClass 才能正常安装。对于单节点环境，需要创建本地存储：

```bash
# 创建存储目录
mkdir -p /mnt/prometheus
chmod 777 /mnt/prometheus

# 应用存储配置
kubectl apply -f storage-class.yaml
```


### 2. 安装 KubeSphere

```bash
export KKZONE=cn
kubectl apply -f kubesphere-installer.yaml 
kubectl apply -f cluster-configuration.yaml
```

