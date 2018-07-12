class HomeController < ApplicationController
  def index
      @db_st = Grade.pluck(:st_number)
      @db_sb = Grade.pluck(:sub_number)
      @db_st_birthday = Grade.pluck(:st_birthday)
  end
  
  def index2
    @grades=Grade.all
  end
  
  def new
  end
  
  def create
    @grade.new
    
    @grade.st_number = params[:st_number]
    @grade.st_birthday = Stduent.find_by(st_number: params[:st_number]).st_birthday #교수가 직접 쓸 필요 X
    @grade.sub_number = params[:sub_number]
    @grade.mid_score = params[:mid_score]
    @grade.final_score = params[:final_score]
    @grade.hw = params[:hw]
    @grade.attend = params[:attend]
    @grade.student_id = Stduent.find_by(st_number: params[:st_number]).id #교수가 직접 쓸 필요 X
    @grade.subject_id = Subject.find_by(sub_number: params[:sub_number]).id #교수가 직접 쓸 필요 X
    
    @grade.save
    
    redirect_to "/home/index2"
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def result #main에서 쓴 값이 넘어와서 처리하는 페이지 // 이곳의 변수는 비교하기 위한 변수
    #@student = Stduent.new
    #@student.st_number = params[:st_number] #검색 위한 학번 입력
    #@student.st_birthday = params[:st_birthday] # 검색 위한 생일 입력
    
    #@subject = Subject.new
    #@subject.sub_number = params[:sub_number] # 검색 위한 과목코드 입력
    #@subject.saves
    
    @grades = Grade.all
    @grades.each do |grade|
      grade.total = (grade.mid_score * 0.3) + (grade.final_score * 0.4) + (grade.hw * 0.15) + (grade.attend * 15)
      grade.save
    end
 
    @myName = Stduent.find_by(st_number: params[:st_number]).st_name
    @mySubName = Subject.find_by(sub_number: params[:sub_number]).sub_name
    @myGrade = Grade.find_by(st_number: params[:st_number], sub_number: params[:sub_number], st_birthday: params[:st_birthday])
    if (@myGrade != nil)
      @otherGrade = Grade.where(sub_number: params[:sub_number]).order("total DESC")
      @otherGrade.each_with_index do |og,index|
       if @myGrade.id == og.id
         @rank = index + 1
       end
    end
      
    @arr_size = Grade.where(sub_number: params[:sub_number]).length
    if @rank < (@arr_size * 0.3)
      @myGrade_credit = 'A' 
    elsif @rank < (@arr_size * 0.7)
      @myGrade_credit = 'B'
    else @rank <= (@arr_size)
      @myGrade_credit = '큰 일'
    end
  end
  end
  end
  
