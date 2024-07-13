# frozen_string_literal: true

require "hanami/boot"
require_relative "lib/rodauth/rodauth"

use SaneBudget::RodauthAuthentication
run Hanami.app
