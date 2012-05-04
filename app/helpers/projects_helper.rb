module ProjectsHelper

  def display( resource )
    twitter if resource.type == 'twitter'
    link if resource.type == 'link'
    resource.value if resource.type == 'string'
  end

  def twitter
    handle = resource.value.gsub '@', ''
    link_to resource.value, "http://twitter.com/#{handle}"
  end

  def link
    link_to resource.value
  end

end
