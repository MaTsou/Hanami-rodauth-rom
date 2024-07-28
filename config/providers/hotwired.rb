Hanami.app.register_provider :hotwired do
  prepare do
    require target.root.join( "lib/hotwired_helpers" )
  end

  start do
    register "hotwired", HotwiredHelpers.new
  end
end
