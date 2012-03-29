ActiveAdmin.register GenericItem do
  menu :priority => 1
  index do
    column :name ,:sortable => :name do |generic_item|
      link_to generic_item.name, generic_item, :target => "_blank"
    end
    column :description
    #column :uuid
    column :scores
    column :tips
    column :customer_gender
    # TODO
    #column :category_id_by_usage do |generic_item|
    #end
    #column :category_id_by_shape
    #column :category_id_by_age
    column :created_at, :sortable => :created_at do |entity|
      entity.created_at.strftime('%Y-%m-%d %H:%M')
    end
    column :updated_at, :sortable => :updated_at do |entity|
      entity.updated_at.strftime('%Y-%m-%d %H:%M')
    end
    column do |generic_item|
      link_to_function t('edit'), "open_dialog('#{edit_generic_item_path(generic_item)}')"
    end
    column do |generic_item|
      link_to t('delete'), generic_item, :method => :delete, :confirm => t('confirm_delete')
    end
  end
end
