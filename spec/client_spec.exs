defmodule XMLRPC_Client.ClientSpec do
  alias XMLRPC_Client.Client
  use ESpec

  describe ".url" do
    it "should give nil if no parameters are given" do
      client = %Client {}
      expect(Client.url(client)).to eq(nil)
    end

    it "should give the url with only the hostname if path and port arent' given" do
      client = %Client { host: "www.example.com" }
      expect(Client.url(client)).to eq("www.example.com")
    end

    it "should give the url without the port if it isn't given" do
      client = %Client { host: "www.example.com", path: "xmlrpc" }
      expect(Client.url(client)).to eq("www.example.com/xmlrpc")
    end

    it "should give the url without the path if it isn't given" do
      client = %Client { host: "www.example.com", port: 1234 }
      expect(Client.url(client)).to eq("www.example.com:1234")
    end

    it "should give full url if all parameters are given" do
      client = %Client { host: "www.example.com", path: "xmlrpc", port: 1234 }
      expect(Client.url(client)).to eq("www.example.com:1234/xmlrpc")
    end
  end
end
