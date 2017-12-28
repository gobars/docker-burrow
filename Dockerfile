FROM golang:alpine

RUN apk add --update bash curl git && apk add ca-certificates wget && update-ca-certificates && rm -rf /var/cache/apk/*

RUN go get github.com/linkedin/Burrow \
    github.com/golang/dep/cmd/dep

WORKDIR $GOPATH/src/github.com/linkedin/Burrow

RUN dep ensure && go install && mkdir -p /etc/burrow/

ADD ./ /etc/burrow/
WORKDIR /etc/burrow/

CMD ["./start.sh"]
