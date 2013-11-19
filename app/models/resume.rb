class Resume < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, :description, length: { minimum: 3 }
  validates :title, uniqueness: true
  mount_uploader :image, ImageUploader
end
