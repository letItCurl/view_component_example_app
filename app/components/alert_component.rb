# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  VARIANTS = {
    success: {
      container: "mb-5",
      alert: "py-2 px-3 bg-green-50 text-green-500 font-medium rounded-md inline-block",
      id: "notice"
    },
    error: {
      container: "mb-5",
      alert: "py-2 px-3 bg-red-50 text-red-500 font-medium rounded-md inline-block",
      id: "alert"
    },
    warning: {
      container: "mb-5",
      alert: "py-2 px-3 bg-yellow-50 text-yellow-500 font-medium rounded-md inline-block",
      id: "warning"
    },
    info: {
      container: "mb-5",
      alert: "py-2 px-3 bg-blue-50 text-blue-500 font-medium rounded-md inline-block",
      id: "info"
    }
  }.freeze

  def initialize(message:, type: :success, dismissible: false)
    @message = message
    @type = type
    @dismissible = dismissible
  end

  private

  attr_reader :message, :type, :dismissible

  def variant_classes
    VARIANTS[type] || VARIANTS[:success]
  end

  def container_classes
    variant_classes[:container]
  end

  def alert_classes
    variant_classes[:alert]
  end

  def alert_id
    variant_classes[:id]
  end
end
