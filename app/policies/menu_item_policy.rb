# frozen_string_literal: true

class MenuItemPolicy
  attr_reader :cook, :menu_item

  def initialize(cook, record)
    @cook = cook
    @menu_item = menu_item
  end


  def update?
    false
  end

end