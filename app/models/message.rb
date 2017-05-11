class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :text, presence: true
  validates :user_id, presence: true

  mount_uploader :image, ImageUploader
end
