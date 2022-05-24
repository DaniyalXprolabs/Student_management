class PagesController < ApplicationController
  def index
    @students=Student.all
    @courses=Course.all
    @projects=Project.all
    @tot_students=Student.group(:gender).count
  end
end
