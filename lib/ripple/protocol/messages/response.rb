module Ripple
  module Protocol
   module Messages

    # A Message received from a peer that represents either a response to a command
    # or an update pursuant to an active subscription
    class Response < Message
    end

   end
  end
end

require 'ripple/protocol/messages/response/domain_specific_language'