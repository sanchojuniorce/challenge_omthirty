FactoryBot.define do
  factory :endereco do
    cep { '60190630' }
    logradouro { 'Avenida das Castanholeiras' }
    complemento { 'Novo' }
    bairro { 'Cidade 2000' }
    cidade { 'Fortaleza' }
    uf { 'CE' }
    codigo_ibge { 23 }
    #association(:municipe)
  end
end