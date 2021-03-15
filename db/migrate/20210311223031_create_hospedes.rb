class CreateHospedes < ActiveRecord::Migration[6.1]
  def change
    create_table :hospedes do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.date :data_nascimento

      t.timestamps
    end
  end
end
