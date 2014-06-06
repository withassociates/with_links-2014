ActiveAdmin.register Theme do
  config.sort_order = 'issue_number DESC'
  config.per_page = 5

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
  permit_params :issue_date, :title, :issue_number, :published, :ready_to_send,
    links_attributes: [:id, :sort_order, :title, :issue_number, :url, :description, :icon, :icon_attribution_file, 
                       :is_away, :person, :person_id, :_destroy]

  index as: :block do |theme|
    div for: theme do
      h2 "#{theme.title} - Issue #{theme.issue_number}", class: 'theme-title-index'
      h3 link_to("Edit this Theme", edit_admin_theme_path(theme)), class: 'edit-link'

      if theme.ready_to_send? && theme.sent_at.nil?
        stamp_present = true
        stamp = "READY TO SEND"
      elsif theme.ready_to_send? && theme.sent_at.present?
        stamp_present = true
        stamp = "SENT"
      end

      if stamp_present
        h3 stamp, class: 'ready-to-send'
      end

      div class: 'sort_these' do
        theme.links.sorted.each do |link|
          h3 "#{link.person.try(:name)} - #{link.title}", class: "index-link", id: link.id
        end
      end
    end
  end

  form :html => { enctype: "multipart/form-data" } do |f|
    f.inputs "Theme" do
      f.input :title, label: "Theme title"
      f.input :issue_date, label: "Issue date"
      f.input :issue_number, label: "Issue number"
      f.input :published, label: "Published to site?"
      f.input :ready_to_send, label: "Ready to send?", as: :boolean
    end
    f.inputs "Links" do
      f.has_many :links, for: [:links, f.object.links.sorted], allow_destroy: true do |cf|
        cf.input :person
        cf.input :icon, as: :file, hint: cf.object.icon.present? \
        ? cf.template.image_tag(cf.object.icon.url(:thumb))
        : cf.template.content_tag(:span, "No image yet!")
        cf.input :is_away, label: "Person is away?"
        cf.input :title
        cf.input :url, label: "URL"
        cf.input :description, label: "Link description", input_html: { rows: 2 }
        cf.input :icon_attribution_file, as: :file
      end
    end
    f.actions
  end

  collection_action :sort, method: :post do
    link_ids = params.require(:link_ids)

    link_ids.each_with_index do |link_id, index|
      Link.where(id: link_id).update_all(sort_order: index)
    end

    render nothing: true
  end
end

