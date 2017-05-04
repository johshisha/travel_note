module RecordsHelper
  
  def create_square_image(rmagick, size)
    # http://qiita.com/9m/items/0e551093ca06a9986fbf
    narrow = rmagick.columns > rmagick.rows ? rmagick.rows : rmagick.columns
    rmagick.crop(Magick::CenterGravity, narrow, narrow).resize(size, size)
  end
  
end
