# protobuf

Example of using protobuf with Strum::Esb

## Installation

Compiler for .proto files

```
apt install -y protobuf-compiler
```

---

## Usage

For generating your Modules based on proto files run

```
grpc_tools_ruby_protoc -I=./  --ruby_out=./ --grpc_out=./ ./**/*.proto
```

---

Link on spec of syntax of proto3: https://developers.google.com/protocol-buffers/docs/proto3

---

Add in handler.rb for correct requires your generated modules

```
$LOAD_PATH.unshift(File.expand_path("..", __dir__))
```

---

For additional information about Strum::Esb:
https://gitlab.com/strum-rb/strum-esb

---

## Useful Links

https://betterprogramming.pub/understanding-protocol-buffers-43c5bced0d47

https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf
