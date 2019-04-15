module BootstrapFlashHelper
  def alert_class(flash_type)
    type = flash_type.to_sym
    case type
    when :notice
      return "alert-success"
    when :alert, :error
      return "alert-danger"
    end
  end
end
