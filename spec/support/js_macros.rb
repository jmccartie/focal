module JsMacros

  def confirm_popup
    page.evaluate_script('window.confirm = function() { return true; }')
    sleep 2
  end

  def dismiss_popup
    page.evaluate_script('window.confirm = function() { return false; }')
  end

end