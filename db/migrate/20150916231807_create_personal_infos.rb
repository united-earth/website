class CreatePersonalInfos < ActiveRecord::Migration
  def change
    create_table :personal_infos do |t|
      t.boolean :add_voice
      t.boolean :newsletter
      t.text :public_feedback
      t.boolean :contrib_admin
      t.boolean :contrib_coord
      t.boolean :contrib_writing
      t.boolean :contrib_translations
      t.boolean :contrib_webdev
      t.boolean :contrib_design
      t.boolean :contrib_dev
      t.boolean :contrib_avprod
      t.boolean :contrib_communication
      t.boolean :contrib_networking
      t.boolean :contrib_education
      t.boolean :contrib_art
      t.boolean :contrib_management
      t.boolean :contrib_fundraising
      t.boolean :contrib_funding
      t.string :contrib_other
      t.string :expertise

      t.references :user

      t.timestamps null: false
    end
  end
end
