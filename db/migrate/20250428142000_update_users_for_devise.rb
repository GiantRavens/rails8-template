class UpdateUsersForDevise < ActiveRecord::Migration[8.0]
  def up
    # First, create a temporary table with the desired structure
    create_table :users_new, id: :string, limit: 36, primary_key: :id do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Custom fields
      t.string :first_name
      t.string :last_name
      t.string :preferred_name
      t.text   :bio

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.timestamps null: false
    end

    # Copy data from the old table to the new one
    execute <<-SQL
      INSERT INTO users_new (id, email, encrypted_password, first_name, last_name, preferred_name, bio,#{' '}
                           reset_password_token, reset_password_sent_at, remember_created_at,#{' '}
                           created_at, updated_at)
      SELECT COALESCE(CAST(id AS TEXT), '#{Random.uuid_v7}'), email, encrypted_password, name_first, name_last, name_preferred, bio,#{' '}
             reset_password_token, reset_password_sent_at, remember_created_at,#{' '}
             created_at, updated_at
      FROM users;
    SQL

    # Drop the old table and rename the new one
    drop_table :users
    rename_table :users_new, :users

    # Add indexes
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end

  def down
    # This is a destructive migration, can't easily go back
    raise ActiveRecord::IrreversibleMigration
  end
end
