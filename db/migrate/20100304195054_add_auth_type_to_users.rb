class AddAuthTypeToUsers < ActiveRecord::Migration
  def self.up
      add_column :users, :auth_type_id, :integer, :default => 1
  end

  def self.down
    remove_column :users, :auth_type_id
  end
end
