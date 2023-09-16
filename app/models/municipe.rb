class Municipe < ApplicationRecord
  require "cpf_cnpj"
  validates :nome, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status, :presence => true

  validate :verify_cpf
  validate :verify_cns

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 


  def verify_cpf
    if cpf.present?
      errors.add(:base, 'Cpf informado é inválido. Favor verificar e informar um cpf válido') if !CPF.valid?(cpf)
    end  
  end
  
  def verify_cns
    if cpf.present?
      errors.add(:base, 'Cns informado é inválido. Favor verificar e informar um cns válido') if cns.present?
    end  
  end

end
