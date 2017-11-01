require "rails_helper"

RSpec.describe HistoriesController, type: :routing do
  describe "routing" do
    it { expect(get: '/histories').to route_to('histories#index') }
  end
end
