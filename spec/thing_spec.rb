require 'spec_helper'
require '../lib/thing'

describe Thing do
  before(:example) do
    @thing = Thing.new(title: 'Сомбреро', category: 'Головной убор', temp_range: '(16, 28)')
  end

  describe '.new' do
    it 'creates a new object' do
      expect(@thing.title).to eq 'Сомбреро'
      expect(@thing.category).to eq 'Головной убор'
      expect(@thing.temp_range).to eq '(16, 28)'
    end
  end

  describe '#suitable_for_weather?' do
    it 'returns true for the set temperature' do
      expect(@thing.suitable_for_weather?(20)).to be_truthy
    end

    it 'returns false for the set temperature' do
      expect(@thing.suitable_for_weather?(0)).to be_falsey
    end
  end

  describe '#to_s' do
    it 'returns data of object in string' do
      expect(@thing.to_s).to eq 'Сомбреро (Головной убор) (16, 28)'
    end
  end
end
