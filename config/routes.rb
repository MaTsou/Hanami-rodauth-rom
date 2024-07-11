# frozen_string_literal: true

module SaneBudget
  class Routes < Hanami::Routes
    
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: "budgets.home"
    get "/budgets/home", to: "budgets.home", as: :home
  end
end
