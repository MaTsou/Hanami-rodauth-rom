# frozen_string_literal: true
#require 'haml'

module SaneBudget
  module Views
    module Budgets
      class Home < SaneBudget::View
        include Deps['repositories.post_repo']

        expose :posts do |account_id:|
          post_repo.from_account( account_id )
        end

        expose :post_author do |posts|
          posts&.first&.account&.email
        end

        expose :icons do
          common = "font-size: 21pt;"# may be a class here. Layout consistency!
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
