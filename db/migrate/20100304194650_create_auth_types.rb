class CreateAuthTypes < ActiveRecord::Migration
  def self.up
    create_table :auth_types do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :auth_types
  end
end
