ActiveAdmin.register SpecificItem  do
  menu :label => "特指的产品"

  # TODO got error here..., see: https://github.com/gregbell/active_admin/pull/623
  #scope :joined, :default => true do |specific_items|
  #  specific_items.includes[:vendor]
  #end

  index do
    column "产品名称", :name do |specific_item|
      link_to specific_item.generic_item.name, generic_item_path(specific_item.generic_item_id), :target => "_blank"
    end
    #column "品牌", :vendor_id, :sortable => "vendors.name" do |specific_item|
    column "品牌", :vendor_id do |specific_item|
      "无" if specific_item.blank?
      specific_item.vendor.name if specific_item.vendor
    end
    column "价格", :price
    column "口碑", :word_of_mouth
    column "物流", :delivery_method
    column "来源网站", :source_website_name
    column "原文地址", :source_url do |specific_item|
      link_to "查看", specific_item.source_url, :target => "_blank"
    end
    column "建立时间", :created_at, :sortable => :created_at do |specific_item|
      specific_item.created_at.strftime('%Y-%m-%d %H:%M')
    end
    column "修改时间", :updated_at, :sortable => :updated_at do |specific_item|
      specific_item.updated_at.strftime('%Y-%m-%d %H:%M')
    end
    #default_actions
    column do |specific_item|
      link_to_function "修改", "open_dialog('#{edit_specific_item_path(specific_item)}')"
    end
    column do |specific_item|
      link_to "删除", specific_item, :method => :delete, :confirm => "确定删除吗？"
    end
  end
end
