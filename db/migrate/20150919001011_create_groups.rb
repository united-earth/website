class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_email
      t.string :country
      t.string :website
      t.string :logo
      t.boolean :cat_ecological
      t.boolean :cat_environment
      t.boolean :cat_indi
      t.boolean :cat_social
      t.boolean :cat_economics
      t.boolean :cat_political
      t.boolean :cat_animal
      t.boolean :cat_activism
      t.boolean :cat_tech
      t.boolean :cat_holistic
      t.boolean :cat_conscious
      t.text :comment
      t.references :user

      t.timestamps null: false
    end
  end
end
