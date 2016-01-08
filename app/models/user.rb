class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :personal_info
  has_many :groups
  before_create :build_personal_info
  before_save :update_mailchimp_status
  mount_uploader :avatar, ImageUploader

  scope :voice_added, -> { joins(:personal_info).where('personal_infos.add_voice = true') }

  def update_mailchimp_status
    return if personal_info.nil?

    list_id = ENV['MAILCHIMP_LIST_ID']
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])

    found = false
    eof = false
    offset = 0
    member_id = nil
    until found or eof do
      members = gibbon.lists(list_id).members.retrieve(params: {offset: offset, count: 100})['members']
      eof = members.empty?
      members.each do |member|
        if member['email_address'] == email
          member_id = member['id']
          found = true
        end
      end
      offset += 100
    end

    begin
      if personal_info.newsletter
        begin
          gibbon.lists(list_id).members.create(body: {email_address: email, status: 'subscribed'})
        rescue Gibbon::MailChimpError => e
          gibbon.lists(list_id).members(member_id).update(body: { status: "subscribed" })
        end
      else
        unless member_id.nil?
          gibbon.lists(list_id).members(member_id).update(body: { status: "unsubscribed" })
        end
      end
    rescue Gibbon::MailChimpError => e
      @error = e.title
    end
  end

end
