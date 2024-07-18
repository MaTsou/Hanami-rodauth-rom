# frozen_string_literal: true

module SaneBudget
  class Routes < Hanami::Routes
    
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: "budgets.home"

    get "/budgets/home", to: "budgets.home", as: :home

    get "/posts/new", to: "posts.new", as: :new_post
    post "/posts", to: "posts.create", as: :create_post
    get "/posts/:id", to: "posts.edit", as: :edit_post
    patch "/posts/:id", to: "posts.update", as: :update_post
    delete "/posts/:id", to: "posts.delete", as: :delete_post
  end
end
