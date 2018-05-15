class Micropost < ApplicationRecord
  belongs_to :user
  has_many :passive_votes, class_name:  "Vote",
                                foreign_key: "micropost_id",
                                dependent:   :destroy
  has_many :likes, through: :passive_votes, source: :voter

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true 
  validates :content, presence: true, length: { maximum: 210 }
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 25.megabytes
        errors.add(:picture, "should be less than 25MB")
      end
    end
end
