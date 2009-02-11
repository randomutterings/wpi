module ListingsHelper
  def setup_listing(listing)
    returning(listing) do |l|
      l.photos.build if l.photos.empty?
    end
  end
end
