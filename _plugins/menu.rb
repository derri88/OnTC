module Jekyll
  module Menu
    def menu(input)
      @Theme = get_theme(input)
      @Menu = ""
      @Menu += "<ul class=\"#{@Theme.data['MenuHeader']}\">"
      @context.registers[:site].pages.each do |page|
        if page.data['DoxType'] == "DoxType_RCList"
          @Menu +="
          <li>
          <a href=\"#{page.data['DoxName']}.html\">
          <i class=\"#{@Theme.data['MenuIcon']}\"></i>
								<span class=\"#{@Theme.data['MenuText']}\"> #{page.data['DoxName']} </span>
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