# frozen_string_literal: true
require 'haml'

module SaneBudget
  module Views
    module Posts
      class New < SaneBudget::View
        expose :account_id
        expose :errors
      end
    end
  end
end
