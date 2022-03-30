FROM alpine:3.15.3
RUN apk --no-cache add ca-certificates curl libc6-compat &&\
  curl -LO "https://github.com/openshift/okd/releases/download/4.10.0-0.okd-2022-03-07-131213/openshift-client-linux-4.10.0-0.okd-2022-03-07-131213.tar.gz" &&\
  curl -LO "https://github.com/openshift/okd/releases/download/4.10.0-0.okd-2022-03-07-131213/sha256sum.txt" &&\
  cat sha256sum.txt | grep openshift-client-linux | sha256sum -c &&\
  mkdir okd-client &&\
  cd okd-client &&\
  tar -xf ../openshift-client-linux-* &&\
  mv oc kubectl /usr/local/bin &&\
  cd .. &&\
  rm -rf okd-client openshift-client-linux-* sha256sum.txt
