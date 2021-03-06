class IdeasController < ApplicationController
before_action :authenticate_user!, except: [:index, :show, :toggle]
before_action :authorize_user!, only: [:edit, :update]
before_action :find_idea, only: [:show, :edit, :update, :destroy]
  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user

    if @idea.save
      redirect_to home_path(@idea)
    else
      render :new
    end
  end

  def show
  @reviews = @idea.reviews
  @review = Review.new
  end

  def index
    @ideas = Idea.order(created_at: :desc)


  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  def edit
  end

  def update
    @idea = Idea.find params[:id]
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def toggle
    p "fucking"
  end

  private
    def authorize_user!
      @idea = Idea.find params[:id]
      unless can?(:manage, @idea)
        flash[:alert] = 'Access Denied!'
        redirect_to idea_path(@idea)
      end
    end

    def find_idea
      @idea = Idea.find params[:id]
    end

    def idea_params
      params.require(:idea).permit(:title, :description)
    end

    def myFunction
        x = document.getElementById("myDIV");
        if x.style.display == "none"
          x.style.display = "block"
        else
            x.style.display = "none"
        end
    end

end
