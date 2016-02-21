require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'admin creates an event' do

    it "must have a non nil title" do
      expect(build(:event, title: nil)).to_not be_valid
    end

    it "must have a non nil description" do
      expect(build(:event, description: nil)).to_not be_valid
    end

    it "must have a non nil place" do
      expect(build(:event, place: nil)).to_not be_valid
    end

    it "must have a non nil address" do
      expect(build(:event, address: nil)).to_not be_valid
    end

    it "must have a non nil opening date" do
      expect(build(:event, opening_date: nil)).to_not be_valid
    end

    it "must have a non nil category" do
      expect(build(:event, category: nil)).to_not be_valid
    end

    it "must have a non nil photo_attachment" do
      expect(build(:event, photo_attachment: nil)).to_not be_valid
    end

    it "must have a non nil hour" do
      expect(build(:event, hour: nil)).to_not be_valid
    end

    it "must have a number as price" do
      expect(build(:event, price: 'number')).to_not be_valid
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

    it "must have a unique combination of title, initial date, hour and place" do
      event = build(:event, :soccer_game)
      event.save
      expect(build(:event, :soccer_game)).to_not be_valid
    end

    it "must have an ending date after opening date" do
      expect(build(:event, ending_date: Date.yesterday)).to_not be_valid
    end

    it "can have an empty ending date" do
      expect(build(:event, ending_date:nil)).to be_valid
    end

    it "must have an opening date bigger or equal current date" do
      expect(build(:event, opening_date: Date.yesterday, ending_date: nil)).to_not be_valid
    end

  end
end
