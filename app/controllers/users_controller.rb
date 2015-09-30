class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)#Chamada do user_params
    if @user.save
      flash[:notice] = 'Cadastro efetuado com sucesso!'
      redirect_to @user
    else
      render :new	
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => 'Cadastro atualizado com sucesso!'
    else
      render :edit
    end
  end

  #Strong Parameters - Estudar, implementado no Rails 4.1. Alguns tutoriais ainda nao apresentam o metodo, estando desatualizados
  def user_params
    params.require(:user).permit(:bio, :email, :full_name, :location, :password, :password_confirmation)
  end

end
