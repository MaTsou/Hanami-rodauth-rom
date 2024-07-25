# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module SaneBudget
  class Action < Hanami::Action
    include Deps[ 'hotwired' ]
    #format :html, :turbo_stream

    def current_account_id( request )
      request.env['rodauth'].session_value
    end
  end
end
