class Municipe < ApplicationRecord
  validates :nome, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status, :presence => true
end
