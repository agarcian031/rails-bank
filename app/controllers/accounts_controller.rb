class AccountsController < ApplicationController
  def index
    current_user #will return the object of the user that is currently logged in | it is a devise helper method 
  end

  def show
  end

  def new
  end

  def edit
  end
end
