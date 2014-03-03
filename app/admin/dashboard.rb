ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "This Week's With Links" do
          div(class: "theme_title") do
            Theme.last.title
          end
          table_for Theme.last.links.order("votes DESC") do
            column("Person") { |link| link.person.name }
            column("Link") { |link| link_to(link.title, link.url) }
            column("Description") { |link| truncate(link.description, length: 100) }
            column("Has icon?") { |link| link.icon.present? ? "yes" : "no" }
            column("Votes") { |link| link.votes }
          end
        end
      end
    end

    columns do
      column do
        panel "Send this week's With Links" do
          div(id: "send_mailout") do
            link_to("Send the latest 'Ready To Send' Theme", latest_issue_path)
          end
        end
      end
    end
  end
end
