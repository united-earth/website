class PersonalInfo < ActiveRecord::Base
  belongs_to :user
  before_save :update_mailchimp_status

  def update_mailchimp_status
    user.update_mailchimp_status
  end
end
