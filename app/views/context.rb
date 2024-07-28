module SaneBudget
  module Views
    class Context < Hanami::View::Context
      include Deps['i18n']
    end
  end
end
