# frozen_string_literal: true

require "hanami/boot"
require_relative "lib/rodauth/rodauth"

use RodauthAuthentication
run Hanami.app
