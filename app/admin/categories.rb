ActiveAdmin.register Category do
  scope :by_usage
  scope :by_shape
  scope :by_age

  index do
    column :name
    column :tip
    column :principle do |category|
      category.principle
    end

    column :created_at, :sortable => :created_at do |entity|
      entity.created_at.strftime('%Y-%m-%d %H:%M')
    end
    column :updated_at, :sortable => :updated_at do |entity|
      entity.updated_at.strftime('%Y-%m-%d %H:%M')
    end

    column do |category|
      link_to_function t('edit'), "open_dialog('#{edit_category_path(category)}')"
    end
    column do |category|
      link_to t('delete'), category, :confirm => t('confirm_delete'), :method => :delete
    end
  end

end
