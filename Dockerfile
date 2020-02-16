FROM golang:1.13-alpine as builder

WORKDIR /
ADD ./main.go .
RUN go build -o app ./main.go

FROM alpine:latest

COPY --from=builder /app .

CMD ["./app"]
