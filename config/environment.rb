# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# this code is used becouse after form submit if there was some error that time rails add div for showing error above the input field 
# which disturb the UI hence this code doesnot allow rails to add that Div
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
end