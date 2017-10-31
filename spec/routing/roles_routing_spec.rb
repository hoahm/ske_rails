require "rails_helper"

RSpec.describe RolesController, type: :routing do
  describe "routing" do
    it { expect(get: '/roles').to route_to('roles#index') }
    it { expect(get: '/roles/new').to route_to('roles#new') }
    it { expect(get: '/roles/1').to route_to('roles#show', id: '1') }
    it { expect(get: '/roles/1/edit').to route_to('roles#edit', id: '1') }
    it { expect(post: '/roles').to route_to('roles#create') }
    it { expect(put: '/roles/1').to route_to('roles#update', id: '1') }
    it { expect(delete: '/roles/1').to route_to('roles#destroy', id: '1') }
  end
end
