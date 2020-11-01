require 'spec_helper'
require 'thing'
require 'things_collection'

describe ThingsCollection do
  describe '#what_to_wear' do

    thing_1 = Thing.new(title: 'Шапка-ушанка', category: 'Головной убор', temp_range: '(-20, 5)')
    thing_2 = Thing.new(title: 'Пальто', category: 'Верхняя одежда', temp_range: '(-5, 10)')
    thing_3 = Thing.new(title: 'Кепка с козырьком', category: 'Головной убор', temp_range: '(20, 35)')
    thing_4 = Thing.new(title: 'Панама', category: 'Головной убор', temp_range: '(20, 35)')

    let(:collection_of_things) { ThingsCollection.new([thing_1, thing_2, thing_3, thing_4]) }

    context 'things is exist' do
      it 'returns things for set temperature' do
        expect(collection_of_things.what_to_wear(0).size).to eq 2
      end

      it 'returns things of different types' do
        expect(collection_of_things.what_to_wear(0).map(&:category)).to match_array(['Головной убор', 'Верхняя одежда'])
      end

      it 'return a thing of the same type' do
        expect(collection_of_things.what_to_wear(20).size).to eq 1
        expect(collection_of_things.what_to_wear(20).uniq.size).to eq 1
      end
    end

    context 'things is not exist' do
      it 'no suitable things' do
        expect(collection_of_things.what_to_wear(-21)).to be_empty
      end
    end
  end

  describe '.things_from_folder' do
    it 'returns array of things' do
      expect(ThingsCollection.from_folder(Dir["#{__dir__}/fixtures/*.txt"])).to be_an Array
    end
  end
end
