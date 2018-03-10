FROM alpine/git

RUN apk add --update make bash &&\ 
    cd /tmp &&\
    git clone https://github.com/git-ftp/git-ftp.git &&\
    cd git-ftp &&\
    tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" &&\
    git checkout "$tag" &&\
    make install

ENTRYPOINT ["/bin/sh", "-c"]