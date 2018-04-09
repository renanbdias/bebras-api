module ServiceExceptionHandler
  def handle_exception
    begin
      yield
    rescue Exception => e
      # Rollbar, eventually?
      fail(e.message)
    end
  end
end