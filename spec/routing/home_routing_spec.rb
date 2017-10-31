require "rails_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do
    it { expect(get: '/').to route_to('home#index') }
  end
end
