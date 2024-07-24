# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module SaneBudget
  class Action < Hanami::Action
    include Deps['persistence.rom']

    def current_account_id( request )
      request.env['rodauth'].session_value
    end

    def turbo_stream?( request )
      request.env['HTTP_ACCEPT'].include? 'turbo-stream'
    end

    def turbo_stream_format
      "text/vnd.turbo-stream.html"
    end

    def turbo_stream_remove( target )
      %Q( <turbo-stream action='remove' target='#{target}'></turbo-stream> )
    end
  end
end
