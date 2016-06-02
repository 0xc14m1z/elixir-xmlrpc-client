defmodule XMLRPC_Client do
  alias XMLRPC_Client.Server

  def call(server, method_name, params \\ []) when (server != nil and method_name != nil and method_name != "") do
    request_body = %XMLRPC.MethodCall{method_name: method_name, params: params} |> XMLRPC.encode!
    response = HTTPotion.post(Server.url(server), [body: request_body])
    response.body |> XMLRPC.decode |> parse_response
  end

  defp parse_response({:ok, %XMLRPC.Fault { fault_code: error_code, fault_string: error_message }}) do
    {:error, "#{error_code} - #{error_message}"}
  end
  defp parse_response({:ok, %XMLRPC.MethodResponse { param: response }}) do
    {:ok, response}
  end

end
