class ImportItems
  def initialize(file_path)
    @xml_file = File.new(file_path)
  end

  def show_how_many_duplicates
    nil_vendor = Vendor.find(5)
    GenericItem.joins(:specific_items => :vendor).all.each do | generic_item|
      vendor_count = Set.new

      generic_item.specific_items.each do |specific_item|
        vendor = specific_item.vendor
        if vendor != nil_vendor
          vendor_count << vendor
        end
      end

      if vendor_count.size > 1
        debug_info= "====GenericItem:#{generic_item.id} has vendors: #{vendor_count.size}"
        Rails.logger.info  debug_info
        #puts debug_info
      end
    end
  end

  def import
    doc = Nokogiri::XML(@xml_file)
    start_at =  Time.now
    GenericItem.transaction do
    doc.root.elements.each do |generic_item_node|
      category_by_usage = Category.find_or_create_by_principle_and_name(
        Category::PRINCIPLE_BY_USAGE, generic_item_node["CommendedCategory"])

      category_by_shape= Category.find_or_create_by_principle_and_name(
        Category::PRINCIPLE_BY_SHAPE, generic_item_node["ProductCategory"])

      category_by_age = Category.find_or_create_by_principle_and_name(
        Category::PRINCIPLE_BY_AGE, generic_item_node["AdaptAge"])
      # TODO 这个策略对吗？, 取得第一个出现在saleShop中的vendor
      vendor = nil
      generic_item_node.css("SaleShops SaleShop").each do |specific_item_node|
        unless specific_item_node["SaleBrand"].blank?
          vendor = Vendor.find_or_create_by_name( specific_item_node["SaleBrand"])
          break
        end
      end

      generic_item = GenericItem.new(
        :name => generic_item_node["DisplayName"],
        :description => generic_item_node["FullName"],
        :customer_gender => generic_item_node["AdaptSex"],
        :category_id_by_usage => category_by_usage.id,
        :category_id_by_shape => category_by_shape.id,
        :category_id_by_age => category_by_age.id,
        :scores => generic_item_node["RecommendCounts"],
        :uuid => generic_item_node["ID"],
        :vendor => vendor
      )
      generic_item.save!
      puts "after save,generic_item.ID: #{generic_item_node["ID"]}, item: #{generic_item.uuid}"
      generic_item_node.css("Pictures Picture").each do |image_node|
        ItemImage.create(:generic_item => generic_item, :external_url => image_node["Path"])
      end
      generic_item_node.css("SaleShops SaleShop").each do |specific_item_node|
        SpecificItem.create(:generic_item => generic_item,
          :source_website_name => specific_item_node["ShopName"],
          :price => specific_item_node["SalePrice"],
          :source_url => specific_item_node["SaleLink"],
          :delivery_method => specific_item_node["SaleWuLiu"],
          :word_of_mouth => specific_item_node["SaleReDu"]
        )
      end
      puts "importing: #{generic_item.name}, time: #{Time.now}"
    end
    end # transaction
    puts "done, at : #{Time.now}"
    puts "time elapse: #{ Time.now - start_at}"
  end
end
