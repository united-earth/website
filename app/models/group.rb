class Group < ActiveRecord::Base
  belongs_to :user
  mount_uploader :logo, ImageUploader
  scope :active, -> { where(deleted: false) }
end
