# This migration should be run using sane_budget_password account !!
# How do I do this ?
# run the dedicated file named 'perform_password_migration.rb'
# in the db directory...
require 'rodauth/migrations'

Sequel.migration do
  up do
    create_table(:account_password_hashes) do
      foreign_key :id, :accounts, primary_key: true, type: :Bignum
      String :password_hash, null: false
    end
    Rodauth.create_database_authentication_functions(self)
    user = get(Sequel.lit('current_user')).sub(/_password\z/, '')
    run "REVOKE ALL ON account_password_hashes FROM public"
    run "REVOKE ALL ON FUNCTION rodauth_get_salt(int8) FROM public"
    run "REVOKE ALL ON FUNCTION rodauth_valid_password_hash(int8, text) FROM public"
    run "GRANT INSERT, UPDATE, DELETE ON account_password_hashes TO #{user}"
    run "GRANT SELECT(id) ON account_password_hashes TO #{user}"
    run "GRANT EXECUTE ON FUNCTION rodauth_get_salt(int8) TO #{user}"
    run "GRANT EXECUTE ON FUNCTION rodauth_valid_password_hash(int8, text) TO #{user}"

    # Used by the disallow_password_reuse feature
    create_table(:account_previous_password_hashes) do
      primary_key :id, type: :Bignum
      foreign_key :account_id, :accounts, type: :Bignum
      String :password_hash, null: false
    end
    Rodauth.create_database_previous_password_check_functions(self)

    user = get(Sequel.lit('current_user')).sub(/_password\z/, '')
    run "REVOKE ALL ON account_previous_password_hashes FROM public"
    run "REVOKE ALL ON FUNCTION rodauth_get_previous_salt(int8) FROM public"
    run "REVOKE ALL ON FUNCTION rodauth_previous_password_hash_match(int8, text) FROM public"
    run "GRANT INSERT, UPDATE, DELETE ON account_previous_password_hashes TO #{user}"
    run "GRANT SELECT(id, account_id) ON account_previous_password_hashes TO #{user}"
    run "GRANT USAGE ON account_previous_password_hashes_id_seq TO #{user}"
    run "GRANT EXECUTE ON FUNCTION rodauth_get_previous_salt(int8) TO #{user}"
    run "GRANT EXECUTE ON FUNCTION rodauth_previous_password_hash_match(int8, text) TO #{user}"
  end

  down do
    Rodauth.drop_database_previous_password_check_functions(self)
    Rodauth.drop_database_authentication_functions(self)
    drop_table(:account_previous_password_hashes, :account_password_hashes)
  end
end
