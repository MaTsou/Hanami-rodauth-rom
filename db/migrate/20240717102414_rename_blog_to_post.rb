# frozen_string_literal: true
require 'sequel_postgresql_triggers'

ROM::SQL.migration do
  up do
    rename_table :blogs, :posts
  end

  down do
    rename_table :posts, :blogs
  end
end
