FactoryGirl.define do
  factory :event do
    title { Faker::Name.name }
    description 'A simples description'
    photo { Faker::Bitcoin.address }
    place 'Anywhere'
    address { Faker::Address.street_address }
    opening_date Date.today
    ending_date Faker::Date.forward(2)
    category 'any category'
    price 1.99
    photo_attachment {File.new("#{Rails.root}/spec/images/rails.png")}
    hour '00:00'
  end

  trait :soccer_game do
    title 'Soccer Game'
    place 'Maracana Stadium'
    opening_date Date.today
    hour '14:00'
  end

end
