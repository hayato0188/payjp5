class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.integer :user_id, foreign_key: true
      t.string :token, unique: true
      t.timestamps
    end
  end
end
