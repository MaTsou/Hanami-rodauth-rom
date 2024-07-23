# frozen_string_literal: true

module SaneBudget
  module Actions
    module Posts
      class Delete < SaneBudget::Action
        include Deps['repositories.post_repo']

        def handle(request, response)
          post_repo.delete( request.params[:id] )
          unless request.env['HTTP_ACCEPT'].include? 'turbo-stream'
            response.redirect_to routes.path( :home )
          else
            response.format = "text/vnd.turbo-stream.html"
            response.body = %Q(
             <turbo-stream
             action="remove"
             target="post_#{request.params[:id]}_frame">
             </turbo-stream>
            )
          end
        end
      end
    end
  end
end
