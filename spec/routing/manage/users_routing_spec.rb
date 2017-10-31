require "rails_helper"

RSpec.describe Manage::UsersController, type: :routing do
  describe "routing" do
    it { expect(get: '/manage/users').to route_to('manage/users#index') }
    it { expect(get: '/manage/users/new').to route_to('manage/users#new') }
    it { expect(get: '/manage/users/1').to route_to('manage/users#show', id: '1') }
    it { expect(get: '/manage/users/1/edit').to route_to('manage/users#edit', id: '1') }
    it { expect(post: '/manage/users').to route_to('manage/users#create') }
    it { expect(put: '/manage/users/1').to route_to('manage/users#update', id: '1') }
    it { expect(delete: '/manage/users/1').to route_to('manage/users#destroy', id: '1') }
  end
end
