ActiveAdmin.register Slider do
  menu :priority => 20
  index do
    column :title
    column :content
    column :target_url do |slider|
      link_to slider.target_url, slider.target_url
    end
    column :image_id do |slider|
      link_to image_tag( asset_path slider.image.itself(:medium)),
        asset_path(slider.image.itself(:large)), :target => "_blank"
    end

    column :created_at, :sortable => :created_at do |entity|
      entity.created_at.strftime('%Y-%m-%d %H:%M')
    end
    column :updated_at, :sortable => :updated_at do |entity|
      entity.updated_at.strftime('%Y-%m-%d %H:%M')
    end
    column do |slider|
      link_to_function t('edit'), "open_dialog('#{edit_slider_path(slider)}')"
    end
    column do |slider|
      link_to t('delete'), slider, :confirm => t('confirm_delete'), :method => :delete
    end
  end
  sidebar :help do
    "Need help? Email us at help@example.com"
  end
end
