defmodule XMLRPC_Client.ServerSpec do
  alias XMLRPC_Client.Server
  use ESpec

  describe ".url" do
    it "should give nil if no parameters are given" do
      server = %Server {}
      expect(Server.url(server)).to eq(nil)
    end

    it "should give the url with only the hostname if path and port arent' given" do
      server = %Server { host: "www.example.com" }
      expect(Server.url(server)).to eq("www.example.com")
    end

    it "should give the url without the port if it isn't given" do
      server = %Server { host: "www.example.com", path: "xmlrpc" }
      expect(Server.url(server)).to eq("www.example.com/xmlrpc")
    end

    it "should give the url without the path if it isn't given" do
      server = %Server { host: "www.example.com", port: 1234 }
      expect(Server.url(server)).to eq("www.example.com:1234")
    end

    it "should give full url if all parameters are given" do
      server = %Server { host: "www.example.com", path: "xmlrpc", port: 1234 }
      expect(Server.url(server)).to eq("www.example.com:1234/xmlrpc")
    end
  end
end
