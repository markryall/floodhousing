When /^I view the (.+) page$/ do |page_name|
 page_class = eval("#{page_name.capitalize}Page")
 goto(page_class)
end

