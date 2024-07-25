# frozen_string_literal: true

module SaneBudget
  module Actions
    module Posts
      class Create < SaneBudget::Action
        include Deps['repositories.post_repo', 'views.posts.new']
        params Params::Create

        def handle(request, response)
          if request.params.valid?
            post_repo.create( request.params[:post] )
            response.redirect_to routes.path( :home )
          else
            response.status = hotwired.unprocessable_status # needed if turbo !
            response.render new,
              account_id: current_account_id( request ),
              errors: request.params.errors[:post]
          end
        end
      end
    end
  end
end
