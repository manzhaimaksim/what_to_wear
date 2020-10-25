require 'spec_helper'
require 'collection_of_things'

describe CollectionOfThings do
  before(:example) do
    things_paths = Dir["#{__dir__}/fixtures/*.txt"]
    things = CollectionOfThings.things_from_folder(things_paths)
    @collection_of_things = CollectionOfThings.new(things)
  end

  describe '.new' do
    it 'new instance is an instance of the CollectionOfThings class' do
      expect(@collection_of_things).to be_an_instance_of(CollectionOfThings)
    end
  end

  describe '#what_to_wear' do
    context 'things is exist' do
      it 'returns things for set temperature' do
        expect(@collection_of_things.what_to_wear(0).size).to eq 2
      end

      it 'returns things of different types' do
        expect(@collection_of_things.what_to_wear(0).map(&:category)).to eq ['Головной убор', 'Верхняя одежда']
      end
    end

    context 'things is not exist' do
      it 'no suitable things' do
        expect(@collection_of_things.what_to_wear(-21).size).to eq 0
      end
    end
  end

  describe '.things_from_folder' do
    it 'returns array of things' do
      expect(CollectionOfThings.things_from_folder(Dir["#{__dir__}/data/*.txt"])).to be_an Array
    end
  end
end
