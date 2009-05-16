class AvatarsController < ApplicationController
  def index
    @avatars = Avatar.all
  end
  
  def show
    if params[:id].blank? && params.include?(:gravatar_id)
      params[:id] = params[:gravatar_id]
    end
    
    begin
      @avatar = Avatar.find_by_md5!(params[:id])
      respond_to do |format|
        format.html
        format.png { send_gravatar(@avatar.avatar.path) }
      end
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { render :text => "Not Found" }
        format.png { send_gravatar(RAILS_ROOT + '/public/images/rails.png')}
      end
    end
  end
  
  def new
    @avatar = Avatar.new
  end
  
  def create
    @avatar = Avatar.new(params[:avatar])
    if @avatar.save
      flash[:notice] = "Successfully created avatar."
      redirect_to @avatar
    else
      render :action => 'new'
    end
  end
  
  def edit
    @avatar = Avatar.find_by_md5!(params[:id])
  end
  
  def update
    @avatar = Avatar.find_by_md5!(params[:id])
    if @avatar.update_attributes(params[:avatar])
      flash[:notice] = "Successfully updated avatar."
      redirect_to @avatar
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @avatar = Avatar.find_by_md5!(params[:id])
    @avatar.destroy
    flash[:notice] = "Successfully destroyed avatar."
    redirect_to avatars_url
  end

  private
  def send_gravatar(filename, mimetype = 'image/png')
    send_file(filename, :type => mimetype, :disposition => 'inline')
  end
end
