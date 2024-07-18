module SaneBudget
  module Persistence
    module Relations
      class Posts < ROM::Relation[:sql]
        schema :posts, infer: true do
          associations do
            belongs_to :account
          end
        end

        auto_struct true # or use Entities (see repository.rb)
        # I think Entities are redundant with Views::Parts... and are a 
        # exposition responsability so Parts are designed for this.

        def with_account_id( id )
          combine( :account ).where( account_id: id ) # can't use 
        end
      end
    end
  end
end
