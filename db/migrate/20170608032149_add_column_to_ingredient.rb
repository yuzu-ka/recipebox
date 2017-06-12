class AddColumnToIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :volume, :integer
  end
end
