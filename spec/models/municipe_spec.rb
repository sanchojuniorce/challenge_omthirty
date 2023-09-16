# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipe, type: :model do
  before(:all) do
    @municipe = create(:municipe)
  end

  it 'is valid with all attributes' do
    expect(@municipe).to be_valid
  end
end