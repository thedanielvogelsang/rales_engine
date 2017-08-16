require_relative 'responders/serialized_responder'

class AppResponder < ActionController::Responder
  include Responders::SerializedResponder
end
