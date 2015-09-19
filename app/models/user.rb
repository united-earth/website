class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :personal_info
  has_many :groups
  before_create :build_personal_info
  mount_uploader :avatar, ImageUploader

  scope :voice_added, -> { joins(:personal_info).where('personal_infos.add_voice = true') }

end
