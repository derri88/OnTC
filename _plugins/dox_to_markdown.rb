module Jekyll

  class DoxToMarkdown < Generator
    safe true

    def generate(site)
      site.pages.each do |page|
        if page.ext=='.dox'
          page.ext='.markdown'
        end

      end
    end
  end

end