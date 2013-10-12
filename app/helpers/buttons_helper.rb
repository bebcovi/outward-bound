module ButtonsHelper
  def back_button(string, path, options = {})
    link_to string.prepend_icon("chevron-left"), path, option
  end

  def delete_button(text, path, options = {})
    link_to text, path, {method: :delete, confirm: "Jeste li sigurni?", class: "delete"}.merge(options)
  end
end
