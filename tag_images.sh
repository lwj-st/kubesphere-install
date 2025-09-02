declare -A images=(
  ["kubesphere/ks-console:v3.3.2"]="registry.cn-beijing.aliyuncs.com/kubesphereio/ks-console:v3.3.2"
  ["kubesphere/ks-apiserver:v3.3.2"]="registry.cn-beijing.aliyuncs.com/kubesphereio/ks-apiserver:v3.3.2"
  ["kubesphere/ks-controller-manager:v3.3.2"]="registry.cn-beijing.aliyuncs.com/kubesphereio/ks-controller-manager:v3.3.2"
  ["kubesphere/kube-rbac-proxy:v0.11.0"]="registry.cn-beijing.aliyuncs.com/kubesphereio/kube-rbac-proxy:v0.11.0"
  ["kubesphere/kube-rbac-proxy:v0.8.0"]="registry.cn-beijing.aliyuncs.com/kubesphereio/kube-rbac-proxy:v0.8.0"
  ["kubesphere/kube-state-metrics:v2.5.0"]="registry.cn-beijing.aliyuncs.com/kubesphereio/kube-state-metrics:v2.5.0"
  ["kubesphere/prometheus-operator:v0.55.1"]="registry.cn-beijing.aliyuncs.com/kubesphereio/prometheus-operator:v0.55.1"
  ["redis:5.0.14-alpine"]="registry.cn-beijing.aliyuncs.com/kubesphereio/redis:5.0.14-alpine"
  ["kubesphere/prometheus-config-reloader:v0.55.1"]="registry.cn-beijing.aliyuncs.com/kubesphereio/prometheus-config-reloader:v0.55.1"
  ["kubesphere/kube-rbac-proxy:v0.11.0"]="registry.cn-beijing.aliyuncs.com/kubesphereio/kube-rbac-proxy:v0.11.0"
  ["prom/alertmanager:v0.23.0"]="registry.cn-beijing.aliyuncs.com/kubesphereio/alertmanager:v0.23.0"
  ["kubesphere/kubectl:v1.21.0"]="registry.cn-beijing.aliyuncs.com/kubesphereio/kubectl:v1.21.0"
  ["mirrorgooglecontainers/defaultbackend-amd64:1.4"]="registry.cn-beijing.aliyuncs.com/kubesphereio/defaultbackend-amd64:1.4"
  ["csiplugin/snapshot-controller:v4.0.0"]="registry.cn-beijing.aliyuncs.com/kubesphereio/snapshot-controller:v4.0.0"
  ["prom/node-exporter:v1.3.1"]="registry.cn-beijing.aliyuncs.com/kubesphereio/node-exporter:v1.3.1"
  ["prom/prometheus:v2.34.0"]="registry.cn-beijing.aliyuncs.com/kubesphereio/prometheus:v2.34.0"
)

for target in "${!images[@]}"; do
  source=${images[$target]}

  echo "==> 拉取阿里云镜像: $source"
  docker pull "$source"

  echo "==> 重命名为目标镜像: $target"
  docker tag "$source" "$target"

  echo "✅ 已就绪: $target"
  echo
done

echo "🎉 所有镜像处理完成。"