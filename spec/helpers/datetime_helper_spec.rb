require 'rails_helper'

RSpec.describe DatetimeHelper do
  describe '#format_date' do
    it 'requires parameter' do
      expect{ helper.format_date }.to raise_error(ArgumentError)
    end

    it 'returns string' do
      expect(helper.format_date(Time.now)).to be_an(String)
    end

    it 'formats time as only date' do
      now = Time.now
      expect(helper.format_date(now)).to eq(now.strftime(I18n.t('time.formats.date_only')))
    end

    it 'formats date' do
      date = Date.today
      expect(helper.format_date(date)).to eq(date.strftime(I18n.t('date.formats.default')))
    end

    it 'returns empty string' do
      expect(helper.format_date('')).to be_empty
    end
  end

  describe '#format_datetime' do
    it 'requires parameter' do
      expect{ helper.format_datetime }.to raise_error(ArgumentError)
    end

    it 'returns string' do
      expect(helper.format_datetime(Time.now)).to be_an(String)
    end

    it 'formats time' do
      now = Time.now
      expect(helper.format_datetime(now)).to eq(now.strftime(I18n.t('time.formats.default')))
    end

    it 'formats date' do
      date = Date.today
      expect(helper.format_datetime(date)).to eq(date.strftime(I18n.t('date.formats.default')))
    end

    it 'returns empty string' do
      expect(helper.format_datetime('')).to be_empty
    end
  end
end
