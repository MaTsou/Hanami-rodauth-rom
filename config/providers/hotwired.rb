Hanami.app.register_provider :hotwired do
  start do
  require target.root.join( "lib/hotwired_helpers" )

  register "hotwired", HotwiredHelpers.new
  end
end
