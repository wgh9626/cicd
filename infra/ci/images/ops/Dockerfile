FROM alpine:3.20

WORKDIR /workspace

ENV TZ=Asia/Shanghai

RUN apk add --no-cache \
bash \
git \
curl \
openssh-client \
ca-certificates \
tzdata && \
update-ca-certificates

RUN ARCH="$(uname -m)" && \
case "$ARCH" in \
x86_64) ARCH=amd64 ;; \
aarch64) ARCH=arm64 ;; \
armv7l) ARCH=arm ;; \
*) echo "unsupported arch: $ARCH" && exit 1 ;; \
esac && \
curl -fsSL "https://dl.k8s.io/release/v1.30.1/bin/linux/${ARCH}/kubectl" -o /usr/local/bin/kubectl && \
chmod +x /usr/local/bin/kubectl && \
curl -fsSL "https://github.com/mikefarah/yq/releases/download/v4.44.3/yq_linux_${ARCH}" -o /usr/local/bin/yq && \
chmod +x /usr/local/bin/yq

CMD ["cat"]

