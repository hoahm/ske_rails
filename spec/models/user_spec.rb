require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Fields' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_column(:sign_in_count).of_type(:integer) }
    it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { should have_db_column(:current_sign_in_ip).of_type(:inet) }
    it { should have_db_column(:last_sign_in_ip).of_type(:inet) }

    it { should have_db_column(:full_name).of_type(:string) }
    it { should have_db_column(:state).of_type(:integer) }
    it { should have_db_column(:role_id).of_type(:integer) }
    it { should have_db_column(:is_root).of_type(:boolean) }

    it { should have_db_column(:avatar_file_name) }
    it { should have_db_column(:avatar_content_type) }
    it { should have_db_column(:avatar_file_size) }
    it { should have_db_column(:avatar_updated_at) }

    it { should have_db_index(:email) }
  end

  describe 'Associations' do
    it { should belong_to(:role) }
    it { expect(User.reflect_on_association(:role).macro).to eq(:belongs_to) }
  end

  describe 'Validations' do
    it { validate_presence_of(:full_name) }
    it { should enumerize(:state).in(:active, :deactive) }

    it { should have_attached_file(:avatar) }
    it { should validate_attachment_content_type(:avatar).allowing('image/jpeg', 'image/png', 'image/jpg') }
    it { should validate_attachment_size(:avatar).less_than(4.megabytes) }
    it { expect(User.attachment_definitions[:avatar][:styles][:thumb]).to eq(['300x300#', :jpg]) }
  end
end
