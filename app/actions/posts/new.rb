# frozen_string_literal: true

module SaneBudget
  module Actions
    module Posts
      class New < SaneBudget::Action
        def handle(request, response)
          response[:account_id] = current_account_id( request )
        end
      end
    end
  end
end
