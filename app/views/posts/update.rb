# frozen_string_literal: true

module SaneBudget
  module Views
    module Posts
      class Update < SaneBudget::View
        include Deps['repositories.post_repo']

        expose :post do |id:|
          post_repo.by_id( id )
        end
      end
    end
  end
end
