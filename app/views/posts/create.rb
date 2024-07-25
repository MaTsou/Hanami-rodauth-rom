# frozen_string_literal: true

module SaneBudget
  module Views
    module Posts
      class Create < SaneBudget::View
        include Deps['repositories.post_repo']

        expose :post

        expose :icons do
          common = "font-size: 1.618em;"# may be a class here. Layout consistency!
          { edit:
            icon.render( 'edit', style: [ common, 'color: blue;'].join(' ') ),
            trash:
            icon.render( 'trash', style: [ common, 'color: red;'].join(' ') ),
          }
        end

      end
    end
  end
end
