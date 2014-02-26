module Jekyll
  module GetTheme
  def get_theme(theme)
    @context.registers[:site].pages.each do |page|
      if page.data['CssName'] == theme
        return page
      end
    end
  end
  end
end
Liquid::Template.register_filter(Jekyll::GetTheme)