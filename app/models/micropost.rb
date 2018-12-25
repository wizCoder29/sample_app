class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader #Adding an image to the Micropost model.
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
 
 #Adding validations to images.
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end