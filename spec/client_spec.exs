defmodule XMLRPC_Client.ClientSpec do
  use ESpec

  describe ".url" do
    it "should give nil if no parameters are given" do
      client = %XMLRPC_Client.Client { }
      expect(client).to eq(nil)
    end

    it "should give full url if all parameters are given" do
      client = %XMLRPC_Client.Client { host: "www.example.com", path: "xmlrpc", port: 1234 }
      expect(XMLRPC_Client.Client.url(client)).to eq("www.example.com:1234/xmlrpc")
    end

    it "should give the url without the port if it isn't given" do
      client = %XMLRPC_Client.Client { host: "www.example.com", path: "xmlrpc" }
      expect(XMLRPC_Client.Client.url(client)).to eq("www.example.com/xmlrpc")
    end

    it "should give the url without the path if it isn't given" do
      client = %XMLRPC_Client.Client { host: "www.example.com", port: 1234 }
      expect(XMLRPC_Client.Client.url(client)).to eq("www.example.com:1234")
    end

    it "should give the url with only the hostname if path and port arent' given" do
      client = %XMLRPC_Client.Client { host: "www.example.com" }
      expect(XMLRPC_Client.Client.url(client)).to eq("www.example.com")
    end
  end
end
