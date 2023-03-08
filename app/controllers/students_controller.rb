class StudentsController < ApplicationController

  def index
    students = Student.all
    students = Student.where("lower(first_name) = ?", params[:name].downcase).or(Student.where("lower(last_name) = ?", params[:name].downcase)) if params[:name].present?
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
