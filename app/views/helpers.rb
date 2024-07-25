# auto_register: false
# frozen_string_literal: true

module SaneBudget
  module Views
    module Helpers
      # Add your view helpers here
      def frame_id_for( stuff, ref = :id )
        suffix = ref.is_a?( Symbol ) ?
          "_#{stuff.send( ref )}" : "_#{ref}"
        stuff._name.to_s << suffix << "_frame"
      end

    end
  end
end
