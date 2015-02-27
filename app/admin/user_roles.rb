ActiveAdmin.register UserRole do
  # menu entry settings
  menu parent: proc { I18n.t('ecm.user_area.active_admin.menu') }.call

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs do
      f.input :user
      f.input :role
      f.input :valid_from, as: :datepicker
      f.input :valid_to, as: :datepicker
    end
    f.actions
  end

  index do
    column :role
    column :user
    column :valid_from
    column :valid_to
    column :active?
    column :created_at
    column :updated_at
    default_actions
  end
end
