module MingleUnpagerizer
  MINGLE_ITEMS_PER_PAGE = 25

  def find_every options
    cards = []
    the_end = false
    page = 1
    while not the_end do
      before_size = cards.size
      options[:params].merge!({ :page => page })
      cards += super(options).to_a
      cards.uniq!
      nothing_added = cards.size == before_size
      if cards.size < MINGLE_ITEMS_PER_PAGE or nothing_added then the_end = true end
      page += 1
    end
    cards
  end
end

