require 'rails_helper'

RSpec.describe ButtonHelper do
  describe '#fontawesome' do
    it "requires parameters" do
      expect { helper.fontawesome }.to raise_error(ArgumentError)
    end

    it 'returns a String' do
      expect(helper.fontawesome('search')).to be_a(String)
    end
  end

  describe '#display_tooltip' do
    it "requires parameters" do
      expect { helper.display_tooltip }.to raise_error(ArgumentError)
    end

    it 'returns a Hash' do
      expect(helper.display_tooltip('search')).to be_a(Hash)
    end
  end

  describe '#new_resource_btn' do
    it "requires parameters" do
      expect { helper.new_resource_btn }.to raise_error(ArgumentError)
    end

    it 'returns a String' do
      expect(helper.new_resource_btn(Role, new_role_path)).to be_a(String)
    end
  end

  describe '#view_resource_btn' do
    let(:role) { FactoryGirl.create(:role) }

    it "requires parameters" do
      expect { helper.view_resource_btn }.to raise_error(ArgumentError)
    end

    it 'returns a String' do
      expect(helper.view_resource_btn(role_path(role))).to be_a(String)
    end
  end

  describe '#edit_resource_btn' do
    let(:role) { FactoryGirl.create(:role) }

    it "requires parameters" do
      expect { helper.edit_resource_btn }.to raise_error(ArgumentError)
    end

    it 'returns a String' do
      expect(helper.edit_resource_btn(edit_role_path(role))).to be_a(String)
    end
  end

  describe '#destroy_resource_btn' do
    let(:role) { FactoryGirl.create(:role) }

    it "requires parameters" do
      expect { helper.destroy_resource_btn }.to raise_error(ArgumentError)
    end

    it 'returns a String' do
      expect(helper.destroy_resource_btn(role_path(role))).to be_a(String)
    end
  end
end
