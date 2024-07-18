module SaneBudget
  module Actions
    module Posts
      module Params
        class Create < Hanami::Action::Params
          params do
            required( :post ).hash do
              required( :account_id ).filled( :integer )
              required( :title ).filled( :string )
              optional( :body ).value( :string )
            end
          end
        end
      end
    end
  end
end
