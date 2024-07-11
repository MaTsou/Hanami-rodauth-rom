module SaneBudget
  module Persistence
    module Relations
      class Accounts < ROM::Relation[:sql]
        schema :accounts, infer: true
        auto_struct true # or use Entities (see repository.rb)
        # I think Entities are redundant with Views::Parts... and are a 
        # exposition responsability so Parts are designed for this.
      end
    end
  end
end
