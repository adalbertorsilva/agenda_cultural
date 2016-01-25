class Event < ActiveRecord::Base
  validates :title, :description, :place, :address, :opening_date, :category, :hour, presence: true
  validates :price, numericality:{greater_than_or_equal_to: 0}
  validates :title, uniqueness:{scope:[:opening_date, :hour, :place]}
  has_attached_file :photo_attachment, styles: { original: "300x300>" }, url: "/events/:filename"
  validates_attachment :photo_attachment, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  before_validation :set_price
  before_save :convert_attachment_to_string

  private

  def set_price
    self.price ||= 0
  end

  def convert_attachment_to_string
    self.photo = Base64.encode64(Paperclip.io_adapters.for(self.photo_attachment).read) unless self.photo_attachment.nil?
  end
end
