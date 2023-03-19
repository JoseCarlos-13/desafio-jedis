require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:cep) }
    it { is_expected.to validate_presence_of(:public_place) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:uf) }
    it { is_expected.to validate_presence_of(:neighborhood) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:municipe) }
  end
end
