# auto_register: false
# frozen_string_literal: true

require "hanami/view"
require "haml"

module SaneBudget
  class View < Hanami::View
    include Deps['components.icon']
  end
end
