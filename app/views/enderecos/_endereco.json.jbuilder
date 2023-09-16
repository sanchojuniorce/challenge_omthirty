json.extract! endereco, :id, :cep, :logradouro, :complemento, :bairro, :cidade, :uf, :codigo_ibge, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
