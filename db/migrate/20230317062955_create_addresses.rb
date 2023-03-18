class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :public_place
      t.string :complement
      t.string :city
      t.string :uf
      t.string :ibge_code
      t.references :municipe, null: false, foreign_key: true
      t.string :neighborhood

      t.timestamps
    end
  end
end
