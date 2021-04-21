FROM golang:1.16.3-alpine3.13 AS build
WORKDIR /build
COPY main.go .
RUN go build main.go


FROM scratch
WORKDIR /app
COPY --from=build /build/main .
ENTRYPOINT [ "./main" ]