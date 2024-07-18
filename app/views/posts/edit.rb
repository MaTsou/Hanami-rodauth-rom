# frozen_string_literal: true

module SaneBudget
  module Views
    module Posts
      class Edit < SaneBudget::View
        include Deps['repositories.post_repo']

        expose :post do |id:|
          post_repo.by_id( id )
        end

        expose :errors
      end
    end
  end
end
