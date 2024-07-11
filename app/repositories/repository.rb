module SaneBudget
  module Repositories
    class Repository < ROM::Repository::Root
      include Deps[container: 'persistence.rom']

      #struct_namespace Entities
    end
  end
end

