class AddOriginToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :origin, :string
  end
end
