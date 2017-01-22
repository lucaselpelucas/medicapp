class ApplicationController < ActionController::API
  def legion
    post = params[:user]
    pass = params[:pass]
    results = ActiveRecord::Base.connection.exec_query %Q{CALL login('#{post}','#{pass}',@lls)}
    results = ActiveRecord::Base.connection.exec_query %Q{select @lls}
    ActiveRecord::Base.clear_active_connections!
    render json: results
  end
end
