class AddInventoryNumberToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :inventory_number, :string
  end

  def self.down
    remove_column :tickets, :inventory_number
  end
end
