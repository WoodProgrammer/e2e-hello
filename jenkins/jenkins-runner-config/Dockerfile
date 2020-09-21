FROM jenkinsci/jnlp-slave:3.27-1-alpine
USER root
ENV DOCKERVERSION=19.03.9
RUN apk add curl
ENV KUBE_LATEST_VERSION=v1.16.0
ENV HELM_VERSION=v3.2.4
RUN apk add --no-cache ca-certificates bash git     && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl     && chmod +x /usr/local/bin/kubectl
RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm     && chmod +x /usr/local/bin/helm
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz   && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1                  -C /usr/local/bin docker/docker   && rm docker-${DOCKERVERSION}.tgz
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.15.60 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
RUN apk update \
     && apk add jq \
     && rm -rf /var/cache/apk/*
