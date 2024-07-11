# frozen_string_literal: true

module SaneBudget
  module Actions
    module Budgets
      class Home < SaneBudget::Action
        def handle(request, response)
          account_id = current_account_id( request )
          response[:account_id] = account_id
        end
      end
    end
  end
end
