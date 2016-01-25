require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'admin creates an event' do

    it 'must have a title' do
      expect(build(:event, title: nil)).to_not be_valid
    end

    it 'must have a description' do
      expect(build(:event, description: nil)).to_not be_valid
    end

    it 'must have a place' do
      expect(build(:event, place: nil)).to_not be_valid
    end

    it 'must have a address' do
      expect(build(:event, address: nil)).to_not be_valid
    end

    it 'must have a opening date' do
      expect(build(:event, opening_date: nil)).to_not be_valid
    end

    it 'must have a category' do
      expect(build(:event, category: nil)).to_not be_valid
    end

    it do
       should validate_presence_of :photo_attachment
    end

    it "must set price to zero if it's nil " do
      event = build(:event, price: nil)
      event.save
      expect(event.price).to eq (0.0)
    end

    it "must convert the photo attachment to string" do
      event = build(:event, photo: nil)
      event.save
      expect(event.photo.nil?).to be false
    end

    it "must have a price greater than or equal to zero" do
      expect(build(:event, price: -1)).to_not be_valid
    end

    it "must have an hour" do
      expect(build(:event, hour: nil)).to_not be_valid
    end

    it "must have a unique combination of title, initial date, hour and place" do
      event = build(:event, :soccer_game)
      event.save
      expect(build(:event, :soccer_game)).to_not be_valid
    end
  end
end
