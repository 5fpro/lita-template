require "spec_helper"

describe Lita::Handlers::HandlerExample, lita_handler: true do
  it "#echo" do
    send_command "echo 123123"
    expect(replies.size).to be > 0
    expect(replies.first).to match("123123")
  end

  it "#echo_http" do
    response = http.get("/echo", body: "123")
    expect( response.body ).to match("123")
  end
end
