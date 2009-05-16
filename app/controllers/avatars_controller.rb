class AvatarsController < ApplicationController
  def index
    @avatars = Avatar.all
  end
  
  def show
    begin
      @avatar = Avatar.find_by_md5!(params[:id])
      respond_to do |format|
        format.html
        format.png { send_file(@avatar.avatar.path, :type => @avatar.avatar_content_type, :disposition => 'inline') }
      end
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { render :text => "Not Found" }
        format.png { send_file(RAILS_ROOT + '/public/images/rails.png', :type => 'image/png', :disposition => 'inline')}
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
end
