# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module SaneBudget
  class Action < Hanami::Action
    include Deps['persistence.rom']

    def current_account_id( request )
      request.env['rack.session']['account_id']
      # or request.env['rodauth'].session_value (if env['rodauth'] is set)
    end
  end
end
