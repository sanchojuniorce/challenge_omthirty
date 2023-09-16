class Municipe < ApplicationRecord
  require "cpf_cnpj"
  validates :nome, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status, :presence => true

  validate :verify_cpf
  validate :verify_cns
  validate :verify_date

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  has_one_attached :foto

  def verify_cpf
    if cpf.present?
      errors.add(:base, 'Cpf informado é inválido. Favor verificar e informar um cpf válido') if !CPF.valid?(cpf)
    end  
  end
  
  def verify_cns
    if cns.present?
      errors.add(:base, 'Cns informado é inválido. Favor verificar e informar um cns válido') if !validator_cns(cns)
    end  
  end

  def validator_cns(cns)
    begin
      soma = cns[0].to_i*15 + cns[1].to_i*14 + cns[2].to_i*13 + cns[3].to_i*12 + cns[4].to_i*11 + cns[5].to_i*10 + cns[6].to_i*9 + cns[7].to_i*8 + cns[8].to_i*7 + cns[9].to_i*6 + cns[10].to_i*5 + cns[11].to_i*4 + cns[12].to_i*3 + cns[13].to_i*2 + cns[14].to_i*1
      resto = soma % 11
      if resto != 0
        value = false
      else
        value = true  
      end         
    rescue 
      value = false
    end    
    value
  end  

  def verify_date
    if data_nascimento.present?
     begin
      Date.parse(data_nascimento)
     rescue ArgumentError
      errors.add(:base, 'Data de Nascimento informada é inválido. Favor verificar e informar uma data válida')
     end
    end  
  end 

end
