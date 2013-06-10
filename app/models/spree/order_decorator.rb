Spree::Order.class_eval do
	def update_line_items(line_item_params)
    line_item_params.each do |line_item|
      self.contents.add(Spree::Variant.find(line_item[:variant_id]), line_item[:quantity])
    end
  end
end