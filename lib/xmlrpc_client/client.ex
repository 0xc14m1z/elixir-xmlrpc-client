defmodule XMLRPC_Client.Client do
  alias XMLRPC_Client.Client
  defstruct host: nil, path: nil, port: nil

  def url(%Client { host: hostname, path: nil, port: nil }), do: hostname
  def url(%Client { host: hostname, path: path_name, port: nil }), do: "#{hostname}/#{path_name}"
  def url(%Client { host: hostname, path: nil, port: port_number }), do: "#{hostname}:#{port_number}"
  def url(%Client { host: hostname, path: path_name, port: port_number }), do: "#{hostname}:#{port_number}/#{path_name}"
  def url(%Client { }), do: nil

end
