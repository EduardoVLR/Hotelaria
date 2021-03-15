class CreateReservas < ActiveRecord::Migration[6.1]
  def change
    create_table :reservas do |t|
      t.integer :quarto
      t.date :dataEntrada
      t.date :dataSaida

      t.timestamps
    end
  end
end
