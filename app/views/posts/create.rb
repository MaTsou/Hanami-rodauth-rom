# frozen_string_literal: true

module SaneBudget
  module Views
    module Posts
      class Create < SaneBudget::View
        include Deps['repositories.post_repo']

        expose :post
      end
    end
  end
end
