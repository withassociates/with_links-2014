ActiveAdmin.register_page "Dashboard" do
  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "This Week's With Links" do
          div(class: "theme_title") do
            Theme.first.title
          end
          table_for Theme.first.links.order("votes DESC") do
            column("Person") { |link| link.person.try(:name) }
            column("Link") { |link| link_to(link.title, link.url) }
            column("Description") { |link| truncate(link.description, length: 100) }
            column("Has icon?") { |link| link.icon.present? ? "yes" : "no" }
          end
        end
      end
    end

    columns do
      column do
        panel "Send this week's With Links" do
          div(id: "send_mailout") do
            link_to("Send this week's With Links", latest_issue_path,
                   data: { confirm: "Are you sure?" }, class: 'send-email-button')
          end
        end
      end
    end
  end
end
