ActiveAdmin.register Person do
  menu :label => "People"

  permit_params :name

  index do
    column :name
    default_actions
  end

  form :html => { enctype: "multipart/form-data" } do |f|
    f.inputs "person" do
      f.input :name
    end
    f.actions
  end
end
