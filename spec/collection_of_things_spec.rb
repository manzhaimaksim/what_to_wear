require 'spec_helper'
require '../lib/collection_of_things'

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
    it 'returns array of things' do
      expect(@collection_of_things.what_to_wear(10)).to be_an Array
    end

    it 'returns an array size of 0' do
      expect(@collection_of_things.what_to_wear(-30).size).to eq 0
    end

    it 'returns an array size of 1' do
      expect(@collection_of_things.what_to_wear(-10).size).to eq 1
    end

    it 'returns an array size of 2' do
      expect(@collection_of_things.what_to_wear(3).size).to eq 2
    end
  end
end
