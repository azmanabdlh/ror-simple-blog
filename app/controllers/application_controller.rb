class ApplicationController < ActionController::Base

  # TODO: need to improve
  def render_404
    render template: "errors/404", status: 404
  end
end
