module ProjectsHelper

  def display resource
    return twitter resource if resource.format == 'twitter'
    return link resource if resource.format == 'link'
    resource.value if resource.format == 'string'
  end

  private

  def twitter resource
    handle = resource.value.gsub '@', ''
    link_to resource.value, "http://twitter.com/#{handle}"
  end

  def link resource
    if resource.image
      display_image_link resource
    else
      display_default_link resource
    end
  end

  def display_image_link resource
    link_to resource.value, class: 'img-link' do
      image_tag resource.image
    end
  end

  def display_default_link resource
    # if resource.title
    link_to resource.value, resource.value
  end

end
