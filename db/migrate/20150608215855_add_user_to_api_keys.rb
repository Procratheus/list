class AddUserToApiKeys < ActiveRecord::Migration
  def change
    add_reference :api_keys, :user, index: true
    add_foreign_key :api_keys, :users
  end
end
