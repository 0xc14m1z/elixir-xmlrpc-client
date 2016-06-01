defmodule XMLRPC_Client do
  alias XMLRPC_Client.Client

  def call(client, method_name, params \\ []) when (client != nil and method_name != nil and method_name != "") do
    request_body = %XMLRPC.MethodCall{method_name: method_name, params: params} |> XMLRPC.encode!
    response = HTTPotion.post(Client.url(client), [body: request_body])
    response.body |> XMLRPC.decode
  end

end
