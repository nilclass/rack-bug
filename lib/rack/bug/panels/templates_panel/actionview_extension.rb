if defined?(ActionView) && defined?(ActionView::Template)
  ActionView::Template.class_eval do

    def render_with_rack_bug(*args, &block)
      Rack::Bug::TemplatesPanel.record(path_without_format_and_extension) do
        render_without_rack_bug(*args, &block)
      end
    end

    alias_method_chain :render, :rack_bug
  end
end
