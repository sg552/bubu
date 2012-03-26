class ImportItems
  def initialize(file_path)
    @xml_file = File.new(file_path)
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

      generic_item = GenericItem.new(
        :name => generic_item_node["DisplayName"],
        :description => generic_item_node["FullName"],
        :customer_gender => generic_item_node["AdaptSex"],
        :category_id_by_usage => category_by_usage.id,
        :category_id_by_shape => category_by_shape.id,
        :category_id_by_age => category_by_age.id,
        :scores => generic_item_node["RecommendCounts"],
        :uuid => generic_item_node["ID"]
      )
      generic_item.save!
      puts "after save,generic_item.ID: #{generic_item_node["ID"]}, item: #{generic_item.uuid}"
      generic_item_node.css("Pictures Picture").each do |image_node|
        Image.create(:generic_item => generic_item, :external_url => image_node["Path"])
      end
      generic_item_node.css("SaleShops SaleShop").each do |specific_item_node|
        vendor = Vendor.find_or_create_by_name( specific_item_node["SaleBrand"])
        SpecificItem.create(:generic_item => generic_item,
          :source_website_name => specific_item_node["ShopName"],
          :price => specific_item_node["SalePrice"],
          :source_url => specific_item_node["SaleLink"],
          :delivery_method => specific_item_node["SaleWuLiu"],
          :word_of_mouth => specific_item_node["SaleReDu"],
          :vendor => vendor)
      end
      puts "importing: #{generic_item.name}, time: #{Time.now}"
    end
    end # transaction
    puts "done, at : #{Time.now}"
    puts "time elapse: #{ Time.now - start_at}"
  end
end
