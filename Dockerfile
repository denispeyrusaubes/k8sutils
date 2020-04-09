FROM centos
#RUN apt-get update && apt-get -y install curl & apt-get -y install wget
RUN yum -y update && yum -y install wget && yum -y install git
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN wget https://get.helm.sh/helm-v3.1.2-linux-386.tar.gz && tar xzf helm-v3.1.2-linux-386.tar.gz && chmod +x linux-386/helm &&mv linux-386/helm /usr/local/bin/helm
RUN helm plugin install https://github.com/chartmuseum/helm-push.git
RUN helm repo add chartmuseum http://chartmuseum.retengr.com
