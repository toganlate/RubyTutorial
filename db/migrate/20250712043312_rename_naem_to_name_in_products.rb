class RenameNaemToNameInProducts < ActiveRecord::Migration[8.0] 
  def change
    rename_column :products, :naem, :name
  end
end