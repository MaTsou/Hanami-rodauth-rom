# frozen_string_literal: true
require 'haml'

module SaneBudget
  module Views
    module Budgets
      class Home < SaneBudget::View
        include Deps['repositories.post_repo']

        expose :posts do |account_id:|
          post_repo.from_account( account_id )
        end
      end
    end
  end
end
