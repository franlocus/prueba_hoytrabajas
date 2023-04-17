module ApplicationHelper
  def flash_class(flash_type)
    case flash_type
    when 'notice'
      'bg-green-100 text-green-700'
    when 'alert'
      'bg-red-100 text-red-700'
    else
      ''
    end
  end
end
