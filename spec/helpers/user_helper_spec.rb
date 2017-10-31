require 'rails_helper'

RSpec.describe UserHelper do
  describe '#user_avatar' do
    let(:user) { FactoryGirl.create(:user) }

    it 'requires parameter' do
      expect{ helper.user_avatar }.to raise_error(ArgumentError)
    end

    it 'requires User instance' do
      expect{ helper.user_avatar(nil) }.to raise_error(NoMethodError)
    end

    it 'returns string' do
      expect(helper.user_avatar(user)).to be_a(String)
    end
  end
end
