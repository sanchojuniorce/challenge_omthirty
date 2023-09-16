class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :codigo_ibge

      t.timestamps
    end
  end
end
