module Jekyll

  class DoxToMarkdown < Generator
    safe true

    def generate(site)
      site.pages.each do |page|
        if page.ext=='.dox'
          page.ext='.markdown'
          page.content='{{ 1 | show_as_named_link | upcase}}'
        end
      end
    end
  end

end