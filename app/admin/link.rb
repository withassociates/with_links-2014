ActiveAdmin.register Link do
  menu :label => "Links"
  permit_params :title, :url, :description, :icon, :person,
    people_attributes: [:id, :name]

  index do
    column :person
    column :title
    column :url
    column :description
    default_actions
  end

  form :html => { enctype: "multipart/form-data" } do |f|
    f.inputs "Link" do
      f.input :person
      f.input :url, label: "URL"
      f.input :title, label: "Link title"
      f.input :description, label: "Link description"
      f.input :icon, as: :file
    end
    f.actions
  end
end
