ActiveAdmin.register Permission do
  # menu entry settings
  menu :parent => Proc.new { I18n.t('ecm.user_area.active_admin.menu') }.call

  action_item :only => :index do
    link_to(I18n.t('ecm.user_area.actions.update_engine_provided_permissions'), update_engine_provided_permissions_admin_permissions_path)
  end

  collection_action :update_engine_provided_permissions do
    Ecm::UserArea::PermissionCollector.call
    redirect_to admin_permissions_path
  end

  index do
    column :name
    column :namespace
    column :identifier
    column :enabled
    column :description
    column :created_at
    column :updated_at
    default_actions
  end

  show :title => :to_s do
    panel Permission.human_attribute_name(:role_permissions) do
      table_for permission.role_permissions, :i18n => UserRole do
        column :role
        column :enabled
        column do |role_permission|
          link_to(I18n.t('active_admin.view'), [:admin, role_permission], :class => "member_link view_link") +
          link_to(I18n.t('active_admin.edit'), [:edit, :admin, role_permission], :class => "member_link edit_link")
        end
      end # table_for
    end # panel
  end

  sidebar Permission.human_attribute_name(:details), :only => :show do
    attributes_table_for permission do
      row :namespace
      row :identifier
      row :enabled
      row :created_at
      row :updated_at
    end
  end # sidebar
end
