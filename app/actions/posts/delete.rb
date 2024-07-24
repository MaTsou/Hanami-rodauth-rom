# frozen_string_literal: true

module SaneBudget
  module Actions
    module Posts
      class Delete < SaneBudget::Action
        include Deps['repositories.post_repo']

        def handle(request, response)
          post_repo.delete( request.params[:id] )
          unless turbo_stream?( request )
            response.redirect_to routes.path( :home )
          else
            response.format = turbo_stream_format
            response.body = turbo_stream_remove(
              "post_#{request.params[:id]}_frame"
            )
          end
        end
      end
    end
  end
end
