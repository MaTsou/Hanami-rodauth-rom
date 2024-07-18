module SaneBudget
  module Actions
    module Posts
      module Params
        class Update < Hanami::Action::Params
          params do
            required( :id ).filled( :integer )

            required( :post ).hash do
              required( :title ).filled( :string )
              optional( :body ).value( :string )
            end
          end
        end
      end
    end
  end
end
