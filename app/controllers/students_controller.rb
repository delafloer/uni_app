class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :show]
  skip_before_action :require_user, only: [:new, :create]
  before_action :require_same_user, only: [:edit, :update]

  def index
  	@students = Student.all
  end

  def show
  end

  def new
  	@student = Student.new
  end

  def create
  	@student = Student.new(student_params)
  	if @student.save
  	  flash[:success] = "You have successfully signed up"
  	  redirect_to @student
  	else
  	  render "new"
  	end
  end

  def edit
  end

  def update
  	if @student.update(student_params)
  	  flash[:success] = "You have successfully edited your account"
  	  redirect_to @student
  	else
  	  render "edit"
  	end
  end

  private

  def student_params
  	params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
	  @student = Student.find(params[:id])
  end

  def require_same_user
    if current_user != @student
      flash[:notice] = "You can only change your info"
      redirect_to student_path(current_user)
    end
  end

end