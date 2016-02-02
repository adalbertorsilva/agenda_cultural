require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'admin creates an event' do

    it {should validate_presence_of :title}

    it {should validate_presence_of :description}

    it {should validate_presence_of :place}

    it {should validate_presence_of :address}

    it {should validate_presence_of :opening_date}

    it {should validate_presence_of :category}

    it { should validate_presence_of :photo_attachment}

    it { should validate_presence_of :hour}

    it {should validate_numericality_of :price}

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
  end
end
