class CreateWinners < ActiveRecord::Migration[5.2]
  def change
    create_table :winners do |t|
      t.references :user, foreign_key: true
      t.references :survey, foreign_key: true
    end
  end
end
