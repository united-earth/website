class Group < ActiveRecord::Base
  belongs_to :user

  scope :active, -> { where(deleted: false) }
end
