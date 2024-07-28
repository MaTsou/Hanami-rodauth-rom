Hanami.app.register_provider :i18n do
  prepare do
    require "i18n"
  end

  start do
    # TODO: ensure these match your actual paths (e.g. if you use app/ instead)
    load_paths = Dir["#{target.root}/app/config/locales/**/*.yml"]

    I18n.load_path += load_paths
    I18n.backend.load_translations

    register "i18n", I18n
  end
end
