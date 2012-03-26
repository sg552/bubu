ActiveAdmin.register Vendor do

  menu :label => "生产厂商（商标）"
  index do
    column "厂商名称", :name
    column "提供的服务", :service
    column "建立时间", :created_at, :sortable => :created_at do |entity|
      entity.created_at.strftime('%Y-%m-%d %H:%M')
    end
    column "修改时间", :updated_at, :sortable => :updated_at do |entity|
      entity.updated_at.strftime('%Y-%m-%d %H:%M')
    end
    column do |vendor|
      link_to_function '编辑', "open_dialog('#{edit_vendor_path(vendor)}')"
    end
    column do |vendor|
      link_to '删除', vendor, :confirm => 'Are you sure?', :method => :delete
    end
  end

end
