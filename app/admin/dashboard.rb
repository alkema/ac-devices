ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Unresolved Notifications" do
          ul do
            Notification.unresolved.map do |notification|
              link_title = "#{notification.device_reading.reading_at} #{notification.warning_type}"
              li link_to(link_title, admin_notification_path(notification))
            end
          end
          div do
            pie_chart Notification.unresolved.group(:warning_type).count
          end
        end
      end

    column do
      panel "All Notifications" do
        pie_chart Notification.all.group(:warning_type).count
      end
    end
    end
  end # content
end
