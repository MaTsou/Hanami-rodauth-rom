# frozen_string_literal: true

module SaneBudget
  module Views
    module Posts
      class New < SaneBudget::View
        expose :account_id
        expose :errors, default: {}
      end
    end
  end
end
