require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  context "User acesses the new page" do

    it "must render the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "must have a event instance" do
      get :new
      expect(assigns(:event)).to_not be nil
    end
  end

  context "user creates a new event" do
    describe "with valid fields" do

      before(:each) do
        @image = Rack::Test::UploadedFile.new(Rails.root.join('spec/images/rails.png'), 'image/png')
      end

      it "must persist the event" do
        event = build(:event, photo: nil, photo_attachment: nil)
        event.photo_attachment = @image
        post :create, event: instanciate_event_params(event)
        expect(assigns(:event).id.nil?).to be false
      end

      #it "must render a success page" do
      #  post :create
      #  expect(response).to redirect_to("success")
      #end

    end
  end

  private

  def instanciate_event_params(event)
    {title: event.title, description: event.description, place: event.place, address: event.address, opening_date: event.opening_date, category: event.category, price: event.price, photo_attachment: event.photo_attachment, hour: event. hour}
  end
end
