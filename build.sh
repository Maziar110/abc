#!/bin/sh
# https://golang.org/doc/install/source#environment
mkdir -p build && cd build

VERSION=1.0.0-beta.3




export GOOS=darwin

export GOARCH=arm64

go build -o "abc-${GOARCH}-${VERSION}" -tags 'oss' ./../cmd/abc/...
zip -r "abc-${GOOS}-${GOARCH}-${VERSION}.zip" "abc-${GOARCH}-${VERSION}"

export GOARCH=amd64

go build -o "abc-${VERSION}" -tags 'oss' ./../cmd/abc/...
zip -r "abc-${GOOS}-${VERSION}.zip" "abc-${VERSION}"

export GOOS=windows

go build -o "abc-${VERSION}.exe"  -tags 'oss' ./../cmd/abc/...
zip -r "abc-${GOOS}-${VERSION}.zip" "abc-${VERSION}.exe"

export GOOS=linux

rm "abc-${VERSION}"
go build -o "abc-${VERSION}" -tags 'oss' ./../cmd/abc/...
zip -r "abc-${GOOS}-${VERSION}.zip" "abc-${VERSION}"
