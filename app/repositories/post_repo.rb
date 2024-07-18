module SaneBudget
  module Repositories
    class PostRepo < Repository[:posts]
      commands :create, update: :by_pk, delete: :by_pk

      def by_id( id )
        posts.by_pk( id ).one
      end

      def from_account( id )
        posts.with_account_id id
        # or directly posts.combine( :account ).where( ... ) but this last way 
        # bind repo with db column name ( account_id ! ). Repo have to be db 
        # agnostic !
      end

    end
  end
end
