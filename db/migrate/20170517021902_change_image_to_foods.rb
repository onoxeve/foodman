class ChangeImageToFoods < ActiveRecord::Migration[5.1]
  def change
    change_column :foods, :image, :string
  end
end