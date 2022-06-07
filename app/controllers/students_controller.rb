class StudentsController < ApplicationController
  before_action :find_id, only: [:show,:destroy,:edit,:update,:profile]
  before_action :authenticate_teacher!, only: [:edit, :update, :destroy,:show]
  def index
    #Returning all Students
    @students=Student.all.order(:id)
    # Returning all students order by their first_name
    #@students=Student.order(:first_name).all
    # Returning all students whose id's are matching with given array
    #@students=Student.where(id:[1,3,5,7,9])
    # Returning all students whose id's are matching with given array
    #@students=Student.where.not(id:[1,3,5,7,9])
    # Returning all students whose id's are matching with given array and order them on their first_name descending order
    #@students=Student.where.not(id:[1,3,5,7,9]).order(first_name: :desc)
    # Returning all students whose id's are matching with given array and order them on their first_name ascending order
    #@students=Student.where.not(id:[1,3,5,7,9]).order(first_name: :asc)
    # Using Multiple order
    #@students=Student.all.order(first_name: :desc).order(last_name: :asc)
    #@students=Student.all.order(last_name: :desc)
    #@students=Student.all.order("last_name DESC")
    #Showing all students whose ID's are greater than 50
    # @students=Student.where("id>50")
    #@students=Student.where("id > ?",100)
    #Selecting Specific fields
    #@students=Student.select('first_name','last_name')
    #Showing Distinct Student
    #@students=Student.all.distinct
    @total_students=Student.all.count
    # Counting number of students who have distinct first name
    @tot_students=Student.distinct.count('first_name')
    #@female_students=Student.where(gender:'Female').count
    #@male_students=Student.where(gender: 'Male').count
    @gender=Student.group(:gender).count
    # LIMIT and OFFSET queries
    #@students=Student.limit(5).order(last_name: :asc)
    # Showing student with second last ID
    #@students=Student.order(id: :desc).limit(1).offset(1)
    #@students=Student.where("id>10").order(:first_name).
    #@students=Student.where(id:1..10).order(id: :asc)
  end

  def about
  end

  def profile

  end
  def new
    @student=Student.new
  end

  def show
  end

  def active
    @students=Student.where("gender = ? OR gender=?" ,'Male','Female').order(id: :asc)
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
    params.require(:student).permit(:first_name,:last_name,:email,:gender, :image)
  end
end
