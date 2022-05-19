class CoursesController < ApplicationController
  before_action :getCourse_id, only: [:show,:destroy,:edit,:update]
  def index
    @courses=Course.all
  end
  def new
    @course=Course.new
  end

  def show
   end

  def create
    @course=Course.new(course_params)
    if @course.save
      redirect_to courses_path , notice: "Course has been created Successfully"
    else
      render :index
    end
  end

  def destroy
     @course.destroy
    redirect_to courses_path , notice: "Courses has been deleted successfully"
  end

  def edit

  end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course), notice: "Course has been updated Successfully"
    else
      render :edit
    end
  end

  private

  def getCourse_id
    @course=Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name,:description)
  end
end
