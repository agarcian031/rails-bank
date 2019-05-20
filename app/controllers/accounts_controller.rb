class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  def index
    @accounts = current_user.accounts #will return the object of the user that is currently logged in | it is a devise helper method 
  end

  def show

  end

  def new
    @account = Account.new 
  end

  def create 
    @account = current_user.Account.new(account_params)

    if @account.save
      redirect_to accounts_path 
    else 
      render :new 
    end 

  end 

  def edit

  end

  def update 
    if @account.update(account_params)
      redirect_to @account_path(@account)
    else 
      render :edit 
    end 
  end 

  def destroy 
    @account.destroy 
    redirect_to accounts_path
  end 

  private 
  def set_account
    @account = current_user.Account.find([:id]) #so that it will only find the account of the current user so someone can't just find a random account id without the user. 
  end 

  def account_params
    params.require(:account).permit(:name, :balance)
  end 
end
