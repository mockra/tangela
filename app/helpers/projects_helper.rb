module ProjectsHelper

  def display resource
    if resource.format == 'twitter'
      return render 'projects/resource/twitter', resource: resource
    elsif resource.format == 'link'
      link resource
    elsif resource.format == 'string'
      resource.value
    end
  end

  private

  def link resource
    if resource.image
      return render 'projects/resource/image_link', resource: resource
    else
      display_default_link resource
    end
  end

  def display_default_link resource
    # if resource.title
    link_to resource.value, resource.value
  end

end
