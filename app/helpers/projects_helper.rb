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
    if !resource.image
      return render 'prohects/resource/default_link', resource: resource
    else
      return render 'projects/resource/image_link', resource: resource
    end
  end

end
