# frozen_string_literal: true
require 'sequel_postgresql_triggers'

ROM::SQL.migration do
  up do
    extension :pg_triggers

    pgt_created_at(:blogs,
                   :created_at,
                   :function_name=>:blogs_set_created_at,
                   :trigger_name=>:set_created_at)
    pgt_updated_at(:blogs,
                   :updated_at,
                   :function_name=>:blogs_set_updated_at,
                   :trigger_name=>:set_udpated_at)

    rename_table :blogs, :posts
  end

  down do
    rename_table :posts, :blogs

    drop_trigger(:blogs, :set_updated_at)
    drop_function(:blogs_set_updated_at)

    drop_trigger(:blogs, :set_created_at)
    drop_function(:blogs_set_created_at)
  end
end
