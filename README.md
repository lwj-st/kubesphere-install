# 快速使用

## 装依赖

```bash
apt-get install socat conntrack -y
```


## 部署

```bash
export KKZONE=cn  
echo yes|./kk create cluster --with-kubernetes v1.21.5  --with-kubesphere v3.3.2
```

## 污点处理

```bash
# 查看污点
kubectl get nodes -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints 
# 去污点
# 如果是单节点k8s，需要取消污点，保障业务pod可以调度（node_name 是 kubectl get node 返回的节点名称）
kubectl get node 
kubectl taint nodes ${node_name} node-role.kubernetes.io/master:NoSchedule-
```


# 工具准备

## 编译kk

```bash
cd kubekey
wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go         # 如果之前安装过旧版本先删除
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
make kk
```

## ks-installer 镜像构建

```bash
cd ks-installer
docker build -t registry.cn-hangzhou.aliyuncs.com/kubesphere-tmp/ks-installer:v3.3.2 .
```

# 镜像信息

## kubernetes需要的镜像

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

## KubeSphere 需要镜像

```bash
kubesphereio/ks-installer:v3.3.2
kubesphereio/ks-controller-manager:v3.3.2
kubesphereio/ks-console:v3.3.2
kubesphereio/ks-apiserver:v3.3.2
kubesphereio/kube-state-metrics:v2.5.0
kubesphereio/prometheus-config-reloader:v0.55.1
kubesphereio/prometheus-operator:v0.55.1
kubesphereio/kubectl:v1.21.0
kubesphereio/notification-manager:v1.4.0
kubesphereio/notification-tenant-sidecar:v3.2.0
kubesphereio/notification-manager-operator:v1.4.0
kubesphereio/kube-rbac-proxy:v0.11.0
kubesphereio/kube-rbac-proxy:v0.8.0
```

