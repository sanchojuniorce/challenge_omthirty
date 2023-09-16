FactoryBot.define do
  factory :municipe do
    nome { Faker::Name.name }
    cpf { Faker::CPF.cpf } 
    cns { "881414477520003" }
    email { Faker::Internet.email }
    data_nascimento { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    telefone { Faker::PhoneNumber.cell_phone }
    status { true }
    foto { 
      Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/four_panels.jpg")
    }
  end
end