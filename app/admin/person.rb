ActiveAdmin.register Person do
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

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
