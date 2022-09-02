class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :cantidad
      t.text :descripcion

      t.timestamps
    end
  end
end
