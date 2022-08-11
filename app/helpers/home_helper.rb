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

  def is_exists_current_user_review(item_id)
    item = Item.find(item_id)
    item.reviews.any? && item.reviews[0].user_id == current_user.id
  end

  def is_exists_review(item_id)
    item = Item.find(item_id)
    item.reviews.any?
  end

  def show_datetime(d)
    d.strftime("%Y-%m-%d %H:%M:%S")
  end

  def show_stars(score)
    tag(:img, src: '/assets/ico_star-on.png', class: ('item-review__image--star')) * score +
    tag(:img, src: '/assets/ico_star-off.png', class: ('item-review__image--star')) * (5 - score)
  end

  def is_exists_user_review(user_id)
    user = User.find(user_id)
    user.reviews.any?
  end

  def is_exists_user_favorite(user_id)
    user = User.find(user_id)
    user.favorites.any?
  end

  def get_number_of_review(item_id)
    item = Item.find(item_id)
    item.reviews.size
  end

  def get_all_review
    Review.count
  end

  def get_larger_review
    res = Review.group(:item_id).order('count_item_id DESC').count(:item_id).keys

    arr = []

    res.first(5).each do |v|
      arr.push(v)
    end

    Item.where(id: arr).reverse
  end

  def put_class(value)
    case value
    when 0 then
      'first'
    when 1 then
      'second'
    when 2 then
      'third'
    end
  end

  def get_score_ranking
    Review.select('item_id, SUM(star) AS total_star')
    .group(:item_id)
    .order('total_star desc')
    .limit(5)
  end

  def is_exists_favorite(item_id)
    user = current_user
    user.favorites.where(item_id: item_id).any?
  end
end
