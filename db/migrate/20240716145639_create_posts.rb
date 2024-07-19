# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table( :posts ) do
      primary_key :id, type: :Bignum
      foreign_key :account_id, :accounts, null: false, type: :Bignum, on_delete: :cascade
      String :title, null: false
      String :body
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      index :account_id
    end
  end
end
