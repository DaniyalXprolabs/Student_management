class StudentsController < ApplicationController
  before_action :find_id, only: [:show,:destroy,:edit,:update]
  def index
    @students=Student.all
  end

  def new
    @student=Student.new
  end

  def show
  end

  def create
    @student=Student.new(students_params)
    if @student.save
      redirect_to students_path, notice: "Student has been created Successfully"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(students_params)
      redirect_to student_path(@student), notice: "Student has been updated Successfully"
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to root_path, notice: "Student has been deleted successfully"
  end

  private

  def find_id
    @student=Student.find(params[:id])
  end
  def students_params
    params.require(:student).permit(:first_name,:last_name,:email)
  end
end
