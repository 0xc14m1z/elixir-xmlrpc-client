# elixir-xmlrpc-client
[![Build Status](https://travis-ci.org/ciamiz/elixir-xmlrpc-client.svg?branch=master)](https://travis-ci.org/ciamiz/elixir-xmlrpc-client)

Wrapper of Elixir and Erlang libraries to perform XMLRPC calls.

## Usage

First of all you need to define the server that will handle your remote procedure calls:

```elixir
server = %XMLRPC_Client.Server { host: "www.example.com", path: "xmlrpc", port: 80 }
```
The hostname of the server is the only mandatory value.

To call a remote method on the server just use the ```.call``` method:
```elixir
XMLRPC_Client.call(server, method_name, parameters)
```
The ```parameters``` argument must be a list.
