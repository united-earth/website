module LandingPageHelper
  def make_fullpath(path)
    unless path.start_with?('http://') or path.start_with?('https://')
      return "http://#{path}"
    end
    path
  end
end
