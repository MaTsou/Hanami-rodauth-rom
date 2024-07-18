# frozen_string_literal: true

module SaneBudget
  module Actions
    module Posts
      class Delete < SaneBudget::Action
        include Deps['repositories.post_repo']

        def handle(request, response)
          post_repo.delete( request.params[:id] )
          response.redirect_to routes.path( :home )
        end
      end
    end
  end
end
