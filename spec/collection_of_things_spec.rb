require 'spec_helper'
require 'things_collection'

describe ThingsCollection do
  before(:all) do
    things_paths = Dir["#{__dir__}/fixtures/*.txt"]
    things = ThingsCollection.from_folder(things_paths)
    @collection_of_things = ThingsCollection.new(things)
  end

  describe '#what_to_wear' do
    context 'things is exist' do
      it 'returns things for set temperature' do
        expect(@collection_of_things.what_to_wear(0).size).to eq 2
      end

      it 'returns things of different types' do
        expect(@collection_of_things.what_to_wear(0).map(&:category)).to match_array(['Головной убор', 'Верхняя одежда'])
      end

      it 'return a thing of the same type' do
        expect(@collection_of_things.what_to_wear(20).sample.category).to eq('Головной убор')
      end
    end

    context 'things is not exist' do
      it 'no suitable things' do
        expect(@collection_of_things.what_to_wear(-21)).to be_empty
      end
    end
  end

  describe '.things_from_folder' do
    it 'new instance is an instance of the CollectionOfThings class' do
      expect(@collection_of_things).to be_an_instance_of(ThingsCollection)
    end

    it 'returns array of things' do
      expect(ThingsCollection.from_folder(Dir["#{__dir__}/data/*.txt"])).to be_an Array
    end
  end
end
