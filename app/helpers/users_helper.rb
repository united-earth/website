module UsersHelper
  def check_mark(bool)
    return 'x' if bool
    return '' unless bool
  end
end
