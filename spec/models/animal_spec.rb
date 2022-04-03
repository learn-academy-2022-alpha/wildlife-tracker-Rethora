require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'should be invalid without a common name' do
    animal = Animal.create(latin_name: 'googoogaagaa', kingdom: 'something')
    expect(animal.errors[:common_name]).to_not be_empty
  end
  it 'should be invalid without a latin name' do
    animal = Animal.create(common_name: 'googoogaagaa', kingdom: 'something')
    expect(animal.errors[:latin_name]).to_not be_empty
  end
  it 'common name and latin names cannot be the same' do
    animal = Animal.create(common_name: 'blah', latin_name: 'blah', kingdom: 'animal')
    expect(animal.errors[:base]).to_not be_empty
  end
  it 'should have unique common names' do
    Animal.create(common_name: 'test', latin_name: 'flakjs', kingdom: 'test')
    animal = Animal.create(common_name: 'test', latin_name: 'asdfjkl', kingdom: 'test')
    expect(animal.errors[:common_name]).to_not be_empty
  end
  it 'should have unique latin names' do
    Animal.create(common_name: 'asdf', latin_name: 'test', kingdom: 'test')
    animal = Animal.create(common_name: 'asdfas', latin_name: 'test', kingdom: 'test')
    expect(animal.errors[:latin_name]).to_not be_empty
  end
end
