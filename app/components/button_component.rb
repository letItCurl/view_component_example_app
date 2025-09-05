# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  VARIANTS = {
    primary: "rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600",
    primary_block: "block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600",
    secondary: "block rounded-md bg-white px-3 py-2 text-center text-sm font-semibold text-gray-900 shadow-xs ring-1 ring-inset ring-gray-300 hover:bg-gray-50",
    danger: "rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600",
    link: "text-indigo-600 hover:text-indigo-900",
    danger_link: "text-red-600 hover:text-red-900"
  }.freeze

  def initialize(
    text:,
    variant: :primary,
    href: nil,
    method: nil,
    confirm: nil,
    type: :button,
    **html_options
  )
    @text = text
    @variant = variant
    @href = href
    @method = method
    @confirm = confirm
    @type = type
    @html_options = html_options
  end

  private

  attr_reader :text, :variant, :href, :method, :confirm, :type, :html_options

  def button_classes
    VARIANTS[variant] || VARIANTS[:primary]
  end

  def data_attributes
    data = html_options[:data] || {}
    data[:turbo_confirm] = confirm if confirm
    data[:turbo_method] = method if method
    data
  end

  def all_html_options
    html_options.merge(
      class: button_classes,
      data: data_attributes
    )
  end
end
