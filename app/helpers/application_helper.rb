module ApplicationHelper
  def submit_button_text(record)
    record.persisted? ? "Update" : "Create"
  end
end
