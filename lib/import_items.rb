class ImportItems
  def initialize(file_path)
    @xml_file = File.new(file_path)
  end

  def import
    doc = Nokogiri::XML(@xml_file)
    start_at =  Time.now
    GenericItem.transaction do
    doc.root.elements.each do |generic_item_node|
      generic_item = GenericItem.new(
        :name => generic_item_node["DisplayName"],
        :description => generic_item_node["FullName"],
        :customer_gender => generic_item_node["AdaptSex"],
        :scores => generic_item_node["RecommendCounts"]
      )
      generic_item.save!
      generic_item_node.css("Pictures Picture").each do |image_node|
        Image.create(:generic_item => generic_item, :external_url => image_node["Path"])
      end
      generic_item_node.css("SaleShops SaleShop").each do |specific_item_node|
        SpecificItem.create(:generic_item => generic_item,
          :source_website_name => specific_item_node["ShopName"],
          :price => specific_item_node["SalePrice"],
          :source_url => specific_item_node["SaleLink"],
          :delivery_method => specific_item_node["SaleWuliu"],
          :word_of_mouth => specific_item_node["SaleRedu"]
          )
      end
      puts "importing: #{generic_item.name}, time: #{Time.now}"
    end
    end # transaction
    puts "done, at : #{Time.now}"
    puts "time elapse: #{ Time.now - start_at}"
  end
end
