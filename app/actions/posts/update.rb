# frozen_string_literal: true

module SaneBudget
  module Actions
    module Posts
      class Update < SaneBudget::Action
        include Deps['repositories.post_repo', 'views.posts.edit']
        params Params::Update

        def handle(request, response)
          if request.params.valid?
            post_repo.update( request.params[:id], request.params[:post] )
            unless hotwired.needs_turbo?( request )
              response.redirect_to routes.path( :home )
            else
              response.format = hotwired.turbo_format
              response.render view, id: request.params[:id], layout: false
            end
          else
            response.render edit,
              id: request.params[:id],
              errors: request.params.errors[:post]
          end
        end
      end
    end
  end
end
