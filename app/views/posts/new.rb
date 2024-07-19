# frozen_string_literal: true
require 'haml'

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
