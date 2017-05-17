class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.binary :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
