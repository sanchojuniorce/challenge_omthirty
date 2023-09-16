# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Endereco, type: :model do
  before(:all) do
    @endereco = create(:endereco)
  end

  it 'is valid with all attributes' do
    expect(@endereco).to be_valid
  end
end