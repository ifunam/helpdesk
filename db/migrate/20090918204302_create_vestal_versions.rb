class CreateVestalVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.belongs_to :versioned, :polymorphic => true
      t.text :changes
      t.integer :number
      t.belongs_to :user, :polymorphic => true
      t.string :user_name
      t.string :tag
      t.datetime :created_at
    end

    change_table :versions do |t|
      t.index [:versioned_type, :versioned_id]
      t.index :number
      t.index :created_at
      t.index [:user_id, :user_type]
      t.index :user_name
      t.index :tag
    end
  end

  def self.down
    drop_table :versions
  end
end
