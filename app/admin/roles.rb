ActiveAdmin.register Role do
  # menu entry settings
  menu :parent => Proc.new { I18n.t('ecm.user_area.active_admin.menu') }.call

  action_item :only => :index do
    link_to(I18n.t('ecm.user_area.actions.update_engine_provided_roles'), update_engine_provided_roles_admin_roles_path)
  end

  collection_action :update_engine_provided_roles do
    Ecm::UserArea::RoleCollector.call
    redirect_to admin_roles_path
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
    panel Role.human_attribute_name(:user_roles) do
      table_for role.user_roles, :i18n => UserRole do
        column :user
        column :active?
        column :valid_from
        column :valid_to
        column do |user_role|
          link_to(I18n.t('active_admin.view'), [:admin, user_role], :class => "member_link view_link") +
          link_to(I18n.t('active_admin.edit'), [:edit, :admin, user_role], :class => "member_link edit_link")
        end
      end # table_for
    end # panel
  end

  sidebar Role.human_attribute_name(:details), :only => :show do
    attributes_table_for role do
      row :namespace
      row :identifier
      row :enabled
      row :created_at
      row :updated_at
    end
  end # sidebar
end
