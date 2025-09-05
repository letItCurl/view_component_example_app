# frozen_string_literal: true

class PageTitleComponent < ViewComponent::Base
  def initialize(title:, description: nil)
    @title = title
    @description = description
  end

  private

  attr_reader :title, :description
end
