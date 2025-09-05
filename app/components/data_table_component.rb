# frozen_string_literal: true

class DataTableComponent < ViewComponent::Base
  DEFAULT_HEADER_CLASSES = "py-3.5 pr-3 pl-4 text-left text-sm font-semibold text-gray-900 sm:pl-0"
  DEFAULT_CELL_CLASSES = "py-4 pr-3 pl-4 text-sm font-medium whitespace-nowrap text-gray-900 sm:pl-0"

  def initialize(data:, columns:, actions: nil, empty_state: nil)
    @data = data
    @columns = columns
    @actions = actions
    @empty_state = empty_state
  end

  private

  attr_reader :data, :columns, :actions, :empty_state

  def has_data?
    data.present? && data.any?
  end

  def header_classes(column)
    if column[:hidden_on_mobile]
      "hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 sm:table-cell"
    elsif column[:hidden_on_mobile_lg]
      "hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 lg:table-cell"
    elsif column[:compact_padding]
      "px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
    else
      column[:header_classes] || DEFAULT_HEADER_CLASSES
    end
  end

  def cell_classes(column)
    if column[:hidden_on_mobile]
      "hidden px-3 py-4 text-sm text-gray-500 sm:table-cell"
    elsif column[:hidden_on_mobile_lg]
      "hidden px-3 py-4 text-sm whitespace-nowrap text-gray-500 lg:table-cell"
    elsif column[:compact_padding]
      "px-3 py-4 text-sm whitespace-nowrap text-gray-500"
    else
      column[:cell_classes] || DEFAULT_CELL_CLASSES
    end
  end

  def empty_state_component
    return empty_state if empty_state.present?

    EmptyStateComponent.new(
      icon: "book",
      title: "No books",
      description: "Get started by creating a new book.",
      action_text: "Add book",
      action_path: "new_book_path"
    )
  end
end
