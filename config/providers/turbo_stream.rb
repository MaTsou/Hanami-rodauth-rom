Hanami.app.register_provider :turbo_stream, namespace: true do
  start do
  require target.root.join( "lib/turbo_stream_helpers" )

  register "answer", TurboStreamHelpers.new
  end
end
