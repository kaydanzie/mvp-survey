class AddTimestampsToTables < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :winners, null: true
    add_timestamps :nominations, null: true
  end
end
