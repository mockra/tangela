module ProjectsHelper

  def display( resource )
    return twitter( resource ) if resource.format == 'twitter'
    return link( resource ) if resource.format == 'link'
    resource.value if resource.format == 'string'
  end

  def twitter( resource )
    handle = resource.value.gsub '@', ''
    link_to resource.value, "http://twitter.com/#{handle}"
  end

  def link( resource )
    link_to resource.value
  end

end
