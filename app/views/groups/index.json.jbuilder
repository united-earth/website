json.array!(@groups) do |group|
  json.extract! group, :id, :name, :contact_name, :contact_email, :country, :website, :logo, :cat_ecological, :cat_environment, :cat_indi, :cat_social, :cat_economics, :cat_political, :cat_animal, :cat_activism, :cat_tech, :cat_holistic, :cat_conscious, :comment
  json.url group_url(group, format: :json)
end
