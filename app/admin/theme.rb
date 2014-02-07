ActiveAdmin.register Theme do
  menu :label => "Themes"
  permit_params :issue_date, :title, :issue_number, :published,
    links_attributes: [:id, :title, :url, :description, :icon, :person, :person_id, :_destroy]

  index do
    column :title
    column :issue_date
    column :issue_number
    column :published
    default_actions
  end

  form :html => { enctype: "multipart/form-data" } do |f|
    f.inputs "Theme" do
      f.input :title, label: "Theme title"
      f.input :issue_date, label: "Issue date"
      f.input :issue_number, label: "Issue number"
      f.input :published, label: "Published to site?"
    end
    f.inputs do
      f.has_many :links, allow_destroy: true, heading: 'Links' do |cf|
        cf.input :icon
        cf.input :person
       cf.input :title
       cf.input :url
       cf.input :description
      end
    end
    f.actions
  end
end
