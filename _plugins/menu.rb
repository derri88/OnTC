module Jekyll
  module Menu
    def menu(input)
      @Menu = ""
      @Menu += "<ul class=\"nav nav-list\">"
      @context.registers[:site].pages.each do |page|
        if page.data['DoxType'] == "DoxType_RCList"
          @Menu +="
          <li>
          <a href=\"#{page.data['DoxName']}.html\">
          <i class=\"icon-dashboard\"></i>
								<span class=\"menu-text\"> #{page.data['DoxName']} </span>
          </a>
						</li>"
        end
      end
      @Menu += "</ul>"
      return @Menu
    end
  end
end
Liquid::Template.register_filter(Jekyll::Menu)