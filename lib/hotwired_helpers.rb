class HotwiredHelpers

  def is_turbo?( request )
    request.env['HTTP_ACCEPT'].include? 'turbo-stream'
  end

  def turbo_format
    "text/vnd.turbo-stream.html"
  end

  def turbo_remove( target )
    %Q( <turbo-stream action='remove' target='#{target}'></turbo-stream> )
  end

  def unprocessable_status
    303
  end
end
