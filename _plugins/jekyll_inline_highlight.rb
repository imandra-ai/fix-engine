# jekyll_inline_highlight
#
# A Liquid tag for inline syntax highlighting in Jekyll
#
# https://github.com/bdesham/inline_highlight
#
# Copyright (c) 2014-2015, Tom Preston-Werner and Benjamin Esham
# See README.md for full copyright information.

module Jekyll
	class InlineHighlightBlock < Tags::HighlightBlock

		def add_code_tag(code)
			code_attributes = [
				"class=\"highlight language-#{@lang.to_s.gsub('+', '-')}\"",
				"data-lang=\"#{@lang.to_s}\""
			].join(" ")
			"<code #{code_attributes}>#{code.chomp.strip}</code>"
		end

		def render(context)
			super.strip
		end
	end
end

Liquid::Template.register_tag('ihighlight', Jekyll::InlineHighlightBlock)