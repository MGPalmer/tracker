class ScriptsController < ApplicationController

  def index
    @scripts = Script.find_by_campaign_and_goal(params[:campaign], params[:goal])
    render :layout => false
  end
  
end
