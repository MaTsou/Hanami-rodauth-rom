# frozen_string_literal: true

module SaneBudget
  module Actions
    module Posts
      class Delete < SaneBudget::Action
        include Deps['repositories.post_repo']

        def handle(request, response)
          post_repo.delete( request.params[:id] )
          unless hotwired.is_turbo?( request )
            response.redirect_to routes.path( :home )
          else
            response.format = hotwired.turbo_format
            response.body = hotwired.turbo_remove(
              "post_#{request.params[:id]}_frame"
            )
          end
        end
      end
    end
  end
end
