# frozen_string_literal: true
require 'sequel_postgresql_triggers'

ROM::SQL.migration do
  up do
    extension :pg_triggers

    pgt_created_at(:posts,
                   :created_at,
                   :function_name=>:posts_set_created_at,
                   :trigger_name=>:set_created_at)
    pgt_updated_at(:posts,
                   :updated_at,
                   :function_name=>:posts_set_updated_at,
                   :trigger_name=>:set_udpated_at)
  end

  down do
    drop_trigger(:posts, :set_updated_at)
    drop_function(:posts_set_updated_at)

    drop_trigger(:posts, :set_created_at)
    drop_function(:posts_set_created_at)
  end
end
