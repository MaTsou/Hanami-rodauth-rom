# frozen_string_literal: true

require "hanami"

module SaneBudget
  class App < Hanami::App
    # hanami manage session for form submission (csrf token)
    # rodauth manage session for authentication (account_id value)
    config.actions.sessions = :cookie, {
      key: "sane_budget_hanami_session",
      secret: settings.session_secret,
      expire_after: 60*60*24*365
    }
    config.actions.cookies = {
      domain: "sane_budget.logicore.fr"
    }
  end
end
