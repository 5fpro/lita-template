module Lita
  module Handlers
    class HandlerExample < Handler
      # insert handler code here

      Lita.register_handler(self)
    end
  end
end
