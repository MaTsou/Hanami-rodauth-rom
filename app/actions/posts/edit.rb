# frozen_string_literal: true

module SaneBudget
  module Actions
    module Posts
      class Edit < SaneBudget::Action

        def handle(request, response)
          response[:id] = request.params[:id]
        end
      end
    end
  end
end
