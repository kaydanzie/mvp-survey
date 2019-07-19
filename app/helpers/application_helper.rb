module ApplicationHelper
  def submit_button_text(record)
    record.persisted? ? "Create" : "Update"
  end
end
