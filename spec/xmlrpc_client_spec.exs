defmodule XMLRPC_Client_Spec do
  alias XMLRPC_Client.Client
  use ESpec

  describe ".call" do
    let :client, do: %Client { host: "http://www.advogato.org", path: "XMLRPC" }
    let :method, do: "test.strlen"
    let :params, do: "example"

    it "should return a result if the method is implemented" do
      expect(XMLRPC_Client.call(client, method, params)).to be_ok_result
    end

    it "should should return an error if the method isn't implemented" do
      expect(XMLRPC_Client.call(client, "nonexisting_method", params)).to be_error_result
    end
  end
end
