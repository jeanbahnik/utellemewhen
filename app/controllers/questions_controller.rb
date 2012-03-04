class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @uSearch = Questions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @uSearch }
    end
  end

  def edit
    @uSearch = Questions.find(params[:id])
  end

  # def generate_temp_password(len)
  #   chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  #   newpass = ""
  #   1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
  #   return newpass
  # end

  def create
    if not logged_in?

      # generate a temporary user password
      # new_password = SecureRandom.hex(4)
      new_email_token = SecureRandom.hex(4)

      @user = User.new :email => params[:email], :registered => false, :email_token => new_email_token#:password => new_password, :password_confirmation => new_password, 
      @betold = params[:name]
      @email = @user.email
      
      if @user.save
        UserMailer.auto_generated_user_email(@user, new_email_token, @betold).deliver
      else
        render 'pages/index'
        return
      end
    else
      @user = current_user
    end
    
    @uSearch = Question.new
    # @uSearch = @user.questions.build(params[:question])
    @uSearch.users << @user
    @uSearch.name = params[:name]

    if question = Question.find_by_name(@uSearch.name)
      uq = UserQuestion.new
      uq.user = @user
      uq.question = question
      uq.save
      if logged_in?
        redirect_to root_url
      else
        cookies.signed[:user_id] = @user
        redirect_to edit_user_path(@user, :betold => @betold, :email => @email)
      end
      return
    end

    respond_to do |format|
      if @uSearch.save
        if logged_in?
          format.html { redirect_to user_path(@user), :notice => 'A query was successfully created.' }
          format.json { render :json => @uSearch, :status => :created, :location => @uSearch }
        else
          sign_in_user(@user)
          format.html { redirect_to edit_user_path(@user, :betold => @betold, :email => @email)}
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @uSearch.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @uSearch = Question.find(params[:id])
    
    respond_to do |format|
      if @uSearch.update_attributes(params[:race])
        format.html { redirect_to @uSearch, :notice => 'Question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @uSearch.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @uSearch = Question.find(params[:id])
    @uSearch.destroy
    @user = current_user

    respond_to do |format|
      format.js
      format.html { redirect_to user_path(@user) }
      format.json { head :ok }
    end
  end
end