class CreateNominations < ActiveRecord::Migration[5.2]
  def change
    create_table :nominations do |t|
      t.references :user, foreign_key: true
      t.references :nominee, foreign_key: { to_table: :users }
      t.text :comments
      t.references :survey, foreign_key: true
    end
  end
end
