module Lita
  module Handlers
    class HandlerExample < Handler
      # insert handler code here
      config :auto_save, type: :boolean

      route(/^echo\s+(.+)/, :echo, command: true, help: { "echo TEXT" => "help desc..." })
      def echo(response)
        response.reply(response.matches[0])
        response.reply(response.args.inspect)
        response.reply(response.match_data.inspect)
        response.reply(response.user.name)
      end

      http.get "/echo", :echo_http
      def echo_http(request, response)
        # response.headers["Content-Type"] = "application/json"
        response.body << request.params["body"]
      end

      Lita.register_handler(self)
    end
  end
end
