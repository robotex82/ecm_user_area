ActiveAdmin.register User do
  # menu entry settings
  menu parent: proc { I18n.t('ecm.user_area.active_admin.menu') }.call

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show title: :to_s do
    panel User.human_attribute_name(:user_roles) do
      table_for user.user_roles, i18n: UserRole do
        column :role
        column :active?
        column :valid_from
        column :valid_to
        column do |user_role|
          link_to(I18n.t('active_admin.view'), [:admin, user_role], class: 'member_link view_link') +
            link_to(I18n.t('active_admin.edit'), [:edit, :admin, user_role], class: 'member_link edit_link')
        end
      end # table_for
    end # panel
  end

  sidebar User.human_attribute_name(:details), only: :show do
    attributes_table_for user do
      row :email
      row :reset_password_sent_at
      row :remember_created_at
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :confirmed_at
      row :confirmation_sent_at
      row :unconfirmed_email
      row :failed_attempts
      row :unlock_token
      row :locked_at
      row :created_at
      row :updated_at
    end
  end # sidebar
end
