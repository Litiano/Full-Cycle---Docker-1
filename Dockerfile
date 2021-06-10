FROM golang:1.13-alpine as builder

WORKDIR /go/src/app

COPY hello-world.go hello-world.go

RUN go build -ldflags "-s -w" -a -o app .

FROM scratch
COPY --from=builder /go/src/app/app ./app
CMD ["/app"]
