require 'rails_helper'

RSpec.describe HistoryHelper do
  describe '#track_change' do
    it { expect{ helper.track_change }.to raise_error(ArgumentError) }
  end

  describe '#history_event' do
    it { expect{ helper.history_event }.to raise_error(ArgumentError) }
  end
end
