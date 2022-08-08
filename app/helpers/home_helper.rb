module HomeHelper
  def get_all_collection(model)
    model.all
  end

  def get_featured_category
    category_ids = Item.group(:category_id).count
    sorted_res = category_ids.sort_by { |_, v| v }.reverse.to_h
    res = sorted_res.keys
    arr = []
    9.times do |i|
      ct = Category.find(res[i])
      arr.push(ct)
    end
    arr
  end
end
