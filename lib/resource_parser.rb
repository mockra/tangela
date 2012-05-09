require 'open-uri'
require 'nokogiri'

module ResourceParser

  def self.link(url)
    url = format_link url
    img = get_image url

    if img.nil?
      return nil
    else
      img = img['src']
    end

    url = url.slice( /\A(http|https)(:\/\/){1}[a-z0-9\-\.]{1,}/i )

    format_image( img, url )
  end

  def self.get_image(url)
    doc = Nokogiri::HTML(open url)
    doc.css('img').first
  rescue OpenURI::HTTPError
    return nil
  end

  def self.format_link(url)
    unless url =~ /\Ahttp|https/i
      url = "http://#{url}"
    end
    url
  end

  def self.format_image(img, url)
    unless img =~ /\.(png|jpg|gif|bmp|tif|jpeg)/i
      return nil
    end

    if img =~ /\A\/.*/
      return url + img
    elsif img =~ /\Ahttp|https/i
      return img
    else
      return url + '/' + img
    end
  end

end
