FROM golang:1.17-alpine3.15 as builder
LABEL boringproxy=builder

ARG VERSION
ARG GOOS="linux"
ARG GOARCH="amd64"
ARG BRANCH="master"
ARG REPO="https://github.com/boringproxy/boringproxy.git"

WORKDIR /build

RUN apk add git

RUN git clone --depth 1 --branch "${BRANCH}" ${REPO}

WORKDIR /build/boringproxy

RUN go mod download
RUN cp default_logo.png logo.png

RUN cd cmd/boringproxy && CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} \
	go build -ldflags "-X main.Version=${VERSION}" \
	-o boringproxy

FROM scratch
EXPOSE 80 443
WORKDIR /storage

COPY --from=builder /build/boringproxy/cmd/boringproxy /

ENTRYPOINT ["/boringproxy"]
CMD ["version"]