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

  # context "User accesses the index page" do
  #
  #   it "must get all events for the current date and after" do
  #
  #   end
  #
  # end


  context "user creates a new event" do
    describe "with valid fields" do

      it "must persist the event" do
        event = build(:event)

        attachment = File.new(Rails.root.join('spec/fixtures/images/rails.png'))
        event.photo_attachment = ActionDispatch::Http::UploadedFile.new(tempfile: attachment, filename: File.basename(attachment), type: "image/png")

        post :create, event: instanciate_event_params(event)
        expect(assigns(:event).id.nil?).to be false
      end
    end
  end

  private

  def instanciate_event_params(event)
    {title: event.title, description: event.description, place: event.place, address: event.address, opening_date: event.opening_date, category: event.category, price: event.price, photo_attachment: event.photo_attachment, hour: event. hour}
  end
end
