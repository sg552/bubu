ActiveAdmin.register User do
  index do
    column :email
    column :role
    column :sign_in_count
    column :current_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_at
    column :last_sign_in_ip

    column :created_at, :sortable => :created_at do |entity|
      entity.created_at.strftime('%Y-%m-%d %H:%M')
    end
    column :updated_at, :sortable => :updated_at do |entity|
      entity.updated_at.strftime('%Y-%m-%d %H:%M')
    end
    column do |user|
      link_to_function t('edit'), "open_dialog('#{edit_user_registration_path(current_user.id) }')"
    end
    column do |user|
      #link_to t('delete'), user, :confirm => t('confirm_delete'), :method => :delete
    end

  end
end
