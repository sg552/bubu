ActiveAdmin.register SpecificItem  do
  menu :priority => 2

  index do
    column :name do |specific_item|
      link_to specific_item.generic_item.name, generic_item_path(specific_item.generic_item_id), :target => "_blank"
    end
    column :price
    column :word_of_mouth
    column :delivery_method
    column :source_website_name
    column :source_url do |specific_item|
      link_to t('view'), specific_item.source_url, :target => "_blank"
    end
    column :created_at, :sortable => :created_at do |specific_item|
      specific_item.created_at.strftime('%Y-%m-%d %H:%M')
    end
    column :updated_at, :sortable => :updated_at do |specific_item|
      specific_item.updated_at.strftime('%Y-%m-%d %H:%M')
    end
    column do |specific_item|
      link_to_function t('edit'), "open_dialog('#{edit_specific_item_path(specific_item)}')"
    end
    column do |specific_item|
      link_to t('delete'), specific_item, :method => :delete, :confirm => t('confirm_delete')
    end
  end
end
