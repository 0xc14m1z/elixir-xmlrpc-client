defmodule XMLRPC_Client.Server do
  alias XMLRPC_Client.Server
  defstruct host: nil, path: nil, port: nil

  def url(%Server { host: hostname, path: nil, port: nil }), do: hostname
  def url(%Server { host: hostname, path: path_name, port: nil }), do: "#{hostname}/#{path_name}"
  def url(%Server { host: hostname, path: nil, port: port_number }), do: "#{hostname}:#{port_number}"
  def url(%Server { host: hostname, path: path_name, port: port_number }), do: "#{hostname}:#{port_number}/#{path_name}"
  def url(%Server { }), do: nil

end
