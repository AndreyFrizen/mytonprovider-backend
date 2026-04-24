FROM golang:1.24-alpine AS builder

RUN apk add --no-cache git ca-certificates tzdata

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -mod=vendor -a -installsuffix cgo -ldflags="-w -s" \
    -o /app/bin/service ./cmd

FROM alpine:3.19

RUN apk --no-cache add ca-certificates tzdata wget

RUN adduser -D -g '' appuser

COPY --from=builder /app/bin/service /usr/local/bin/service

RUN mkdir -p /var/log/service && \
    chown -R appuser:appuser /var/log/service

USER appuser

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/service"]
