require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'Fields' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:permissions).of_type(:json) }
  end

  describe 'Association' do
    it { should have_many(:users).dependent(:nullify) }
    it { expect(Role.reflect_on_association(:users).macro).to eq(:has_many) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
