class HomeController < ApplicationController
  before_action :authorized?, only: %i[index]
  def index
  end
end
