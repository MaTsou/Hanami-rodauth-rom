module SaneBudget
  module Repositories
    class AccountRepo < Repository[:accounts]
      def by_id( id )
        accounts.by_pk( id ).one
      end
    end
  end
end
