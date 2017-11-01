require 'rails_helper'

RSpec.describe PaperTrail::Version, type: :model do
  describe 'Fields' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:item_type).of_type(:string) }
    it { should have_db_column(:item_id).of_type(:integer) }
    it { should have_db_column(:event).of_type(:string) }
    it { should have_db_column(:whodunnit).of_type(:string) }
    it { should have_db_column(:object).of_type(:text) }
    it { should have_db_column(:object_changes).of_type(:text) }
  end
end
