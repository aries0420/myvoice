class Resume < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, :description, length: { minimum: 3 }
  validates :title, uniqueness: true
  mount_uploader :image, ImageUploader

  after_save :enqueue_image

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      resume = Resume.find(id)
      resume.key = key
      resume.remote_image_url = resume.image.direct_fog_url(with_path: true)
      resume.save!
    end
  end
end
