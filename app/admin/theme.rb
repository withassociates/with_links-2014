ActiveAdmin.register Theme do
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  action_item only: :edit do
    link_to('Delete this Theme and its Links', delete_theme_and_links_admin_themes_path(id: theme.id),
            method: :delete, confirm: "Are you sure you want to delete this Theme and its Links?")
  end

  collection_action :delete_theme_and_links, method: :delete do
    Link.where(theme_id: params[:id]).destroy_all
    Theme.find(params[:id]).destroy
    redirect_to admin_themes_path
  end

  menu :label => "Themes"
  permit_params :issue_date, :title, :issue_number, :published, :sent,
    links_attributes: [:id, :title, :url, :description, :icon, :icon_attribution_file, 
                       :is_away, :person, :person_id, :_destroy]

  index do
    column :title
    column :issue_date
    column :issue_number
    column :published
    column :sent
    default_actions
  end

  form :html => { enctype: "multipart/form-data" } do |f|
    f.inputs "Theme" do
      f.input :title, label: "Theme title"
      f.input :issue_date, label: "Issue date"
      f.input :issue_number, label: "Issue number"
      f.input :published, label: "Published to site?"
      f.input :sent, label: "Mailout sent?"
    end
    f.inputs do
      f.has_many :links, allow_destroy: true, heading: 'Links' do |cf|
        cf.input :icon, as: :file, hint: cf.template.image_tag(cf.object.icon.url(:thumb))
        cf.input :person
        cf.input :is_away, label: "Person is away?"
        cf.input :title
        cf.input :url, label: "URL"
        cf.input :description, label: "Link description"
        cf.input :icon_attribution_file, as: :file
      end
    end
    f.actions
  end
end

