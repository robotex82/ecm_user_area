ActiveAdmin.register RolePermission do
  # menu entry settings
  menu :parent => Proc.new { I18n.t('ecm.user_area.active_admin.menu') }.call

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs do
      f.input :role
      f.input :permission
      f.input :enabled
    end
    f.actions
  end

  index do
    column :role
    column :permission
    column :enabled
    column :created_at
    column :updated_at
    default_actions
  end
end
