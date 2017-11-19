class CreatePersonas < ActiveRecord::Migration[5.1]
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido
      t.string :identification
      t.string :correo

      t.integer :idEstado
      t.integer :idTipo
      t.integer :idArea
      t.integer :idCargo
      t.integer :idTipoIdentificacion

      t.boolean :eliminado, dafault: false

      t.timestamps
    end
  end
end
