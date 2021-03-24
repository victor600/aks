FROM mcr.microsoft.com/azure-cli:latest

ENV KUBECTL_VERSION=v1.20.0
ENV ISTIO_VERSION=1.8.2

WORKDIR /

# Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

# kubectl
RUN curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# istioctl
RUN curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} TARGET_ARCH=x86_64 sh -
RUN install -o root -g root -m 0755 istio-${ISTIO_VERSION}/bin/istioctl /usr/local/bin/istioctl