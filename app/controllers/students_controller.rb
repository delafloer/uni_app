class StudentsController < ApplicationController
before_action :set_student, only: [:edit, :update, :show]

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
  	  redirect_to root_path
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
  	params.require(:student).permit(:name, :email)
  end

  def set_student
	@student = Student.find(params[:id])
  end

end