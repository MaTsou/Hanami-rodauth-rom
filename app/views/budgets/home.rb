# frozen_string_literal: true

module SaneBudget
  module Views
    module Budgets
      class Home < SaneBudget::View
        include Deps['repositories.account_repo']

        expose :account do |account_id:|
          account_repo.by_id( account_id )
        end
      end
    end
  end
end
