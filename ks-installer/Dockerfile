FROM registry.cn-hangzhou.aliyuncs.com/kubesphere-tmp/ks-installer:v3.3.2-official

USER kubesphere

COPY ks-core/ks-core/files/ks-core/values.yaml  /kubesphere/installer/roles/ks-core/ks-core/files/ks-core/values.yaml
COPY download/defaults/main.yml  /kubesphere/installer/roles/download/defaults/main.yml
COPY download/tasks/sync_images.yml  /kubesphere/installer/roles/download/tasks/sync_images.yml
COPY kubesphere-defaults/tasks/main.yaml /kubesphere/installer/roles/kubesphere-defaults/tasks/main.yaml
