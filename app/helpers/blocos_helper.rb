module BlocosHelper

  def player(url)
    id = url.match(/^[^v]+v.(.{11}).*/)[1]
    url = "http://www.youtube.com/v/#{id}"
    "<object width=\"425\" height=\"344\"><param name=\"movie\" value=\"#{url}?fs=1\"</param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowScriptAccess\" value=\"always\"></param><embed src=\"#{url}?fs=1\"type=\"application/x-shockwave-flash\"allowfullscreen=\"true\"allowscriptaccess=\"always\"width=\"425\" height=\"344\"></embed></object>".html_safe
  end

end
