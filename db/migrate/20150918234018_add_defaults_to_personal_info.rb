class AddDefaultsToPersonalInfo < ActiveRecord::Migration
  def change
    change_column :personal_infos, :add_voice, :boolean, default: :true
    change_column :personal_infos, :newsletter, :boolean, default: :true
  end
end
