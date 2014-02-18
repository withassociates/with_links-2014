ActiveAdmin.register Link do
  # belongs_to :theme
  # belongs_to :person
  menu :label => "Links"
  permit_params :title, :url, :description, :icon, :icon_attribution_file, :is_away, :person, :person_id,
    people_attributes: [:id, :name]

  index do
    column :person
    column :votes
    column :title
    column :url
    column :icon_attribution
    default_actions
  end

  form :html => { enctype: "multipart/form-data" } do |f|
    f.inputs "Link" do
      f.input :person
      f.input :is_away, label: "Is Away?"
      f.input :url, label: "URL"
      f.input :title, label: "Link title"
      f.input :description, label: "Link description"
      f.input :icon, as: :file, hint: f.template.image_tag(f.object.icon.url(:thumb))
      f.input :icon_attribution_file, as: :file
    end
    f.actions
  end
end
