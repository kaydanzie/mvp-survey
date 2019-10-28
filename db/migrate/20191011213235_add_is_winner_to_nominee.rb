class AddIsWinnerToNominee < ActiveRecord::Migration[5.2]
  def change
    add_column :nominations, :is_winner, :boolean, default: false
  end
end
