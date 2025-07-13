class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :product_name
      t.string :user_nickname
      t.integer :quantity

      t.timestamps
    end
  end
end
