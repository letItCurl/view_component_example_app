# frozen_string_literal: true

class NavBarComponent < ViewComponent::Base
  def initialize(title: "The Book Store")
    @title = title
  end

  private

  attr_reader :title
end
