class ApplicationController < ActionController::API
  def titleize(str)
    str.split(/ |\_/).map(&:capitalize).join(" ")
  end


end
