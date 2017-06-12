class RemoveColumnToIngredient < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :volume, :integer
  end
end
