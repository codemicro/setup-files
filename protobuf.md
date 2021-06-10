# Protocol Buffers

## `protoc`

1. Download `protoc-3.17.3-linux-x86_64.zip` from https://github.com/protocolbuffers/protobuf/releases/tag/v3.17.3
2. Extract `bin/protoc` to `/opt/bin`
3. Extract `include/google` to `/usr/local/include`

## `protoc-gen-go`

```bash 
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
```