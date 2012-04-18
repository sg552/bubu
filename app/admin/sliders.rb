ActiveAdmin.register Slider do
  menu :priority => 20
  index do

    div ({:id => "title_bar",:style=>"width:150px"})  do
      div :class => "action_items" do
        link_to_function t('new'), "open_dialog('#{new_slider_path}')"
      end
    end
    column :title
    column :content
    column :target_url do |slider|
      link_to slider.target_url, slider.target_url
    end
    column :image_id do |slider|
      unless slider.slider_image.blank?
        link_to image_tag( asset_path slider.slider_image.itself(:medium)),
          asset_path(slider.slider_image.itself(:large)), :target => "_blank"
      end
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
