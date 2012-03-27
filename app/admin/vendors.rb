ActiveAdmin.register Vendor do

  index do
    column :name
    column :service
    column :created_at, :sortable => :created_at do |entity|
      entity.created_at.strftime('%Y-%m-%d %H:%M')
    end
    column :updated_at, :sortable => :updated_at do |entity|
      entity.updated_at.strftime('%Y-%m-%d %H:%M')
    end
    column do |vendor|
      link_to_function t('edit'), "open_dialog('#{edit_vendor_path(vendor)}')"
    end
    column do |vendor|
      link_to t('delete'), vendor, :confirm => t('confirm_delete'), :method => :delete
    end
  end

end
