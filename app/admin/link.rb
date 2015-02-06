ActiveAdmin.register Link do
  config.sort_order = "sort_order_asc"
  menu :label => "Links"
  permit_params :sort_order, :title, :url, :description, :icon, :icon_attribution_file,
    :is_away, :person, :person_id, :link_category_id, people_attributes: [:id, :name], link_category_attributes: [:id, :name]

  index do
    column :person
    column :votes
    column :title
    column :url
    column :link_category
    column :icon_attribution
    actions
  end

  form :html => { enctype: "multipart/form-data" } do |f|
    f.inputs "Link" do
      f.input :person
      f.input :is_away, label: "Is Away?"
      f.input :url, label: "URL"
      f.input :title, label: "Link title"
      f.input :link_category, label: "Link Category"
      f.input :description, label: "Link description"
      f.input :icon, as: :file, hint: f.template.image_tag(f.object.icon.url(:thumb))
      f.input :icon_attribution_file, as: :file
    end
    f.actions
  end
end
