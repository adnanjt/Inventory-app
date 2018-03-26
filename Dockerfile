
FROM frolvlad/alpine-glibc

# Setting up go env variables
ENV GOVER go1.8.1
ENV GOPATH /app
ENV CMEPATH $GOPATH/src/github.com/intellisys
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin

RUN mkdir -p $GOPATH/pkg \
             $GOPATH/bin \
             $CMEPATH \
             /run/nginx

RUN apk add --update --no-cache openssl \
                                openssh \
                                python \
                                gcc \
                                nodejs-npm \
                                git \
                                nginx \
                                mysql \
                                mysql-client

# Installing Elm
RUN npm install -g elm

# Installing Go
RUN wget https://storage.googleapis.com/golang/$GOVER.linux-amd64.tar.gz \
    && tar -xf $GOVER.linux-amd64.tar.gz -C /usr/local/ \
    && rm $GOVER.linux-amd64.tar.gz

WORKDIR $CMEPATH

EXPOSE 8000 8080-8089

CMD sh $CMEPATH/scripts/start.sh
