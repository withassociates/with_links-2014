ActiveAdmin.register LinkCategory do
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  menu :label => "Link Categories"
  permit_params :name

  index do
    id_column
    column :name
    actions
  end

  form :html => { enctype: "multipart/form-data" } do |f|
    f.inputs "Link Category" do
      f.input :name
    end
    f.actions
  end
end
