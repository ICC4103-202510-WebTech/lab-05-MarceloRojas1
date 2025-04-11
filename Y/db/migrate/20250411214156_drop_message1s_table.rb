class DropMessage1sTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :message_1s
  end
end