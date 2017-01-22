class ApplicationController < ActionController::API
  def legion
    binding.pry
    @post = JSON.parse[:password]
    @pass = JSON.parse[:user]
    results = ActiveRecord::Base.connection.exec_query %Q{CALL login(4545,4545,@lls)}
    results = ActiveRecord::Base.connection.exec_query %Q{select @lls}
    ActiveRecord::Base.clear_active_connections!
    render json: results
  end
end
