Sprockets::DirectiveProcessor.class_eval do
  def process_depend_on_locale_directive(locale_path)
    full_path = Rails.root.join('config/locales', locale_path)
    context.depend_on(full_path)
  end
end
