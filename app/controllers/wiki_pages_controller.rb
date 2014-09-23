class WikiPagesController < ApplicationController
  def show
    @page = WikiPage.find(params[:id])
    @page.revert_to(params[:version].to_i) if params[:version]
  end
  
  def new
    @page = WikiPage.new
  end
  
  def create
    @page = WikiPage.new(params[:wiki_page])
    puts params[:title]
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = WikiPage.find(params[:id])
  end
  
  def update
    @page = WikiPage.find(params[:id])
    if @page.update_attributes(params[:wiki_page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end
  
  def named
    @page = WikiPage.find_or_initialize_by_title(params[:title])
    if @page.new_record?
      render :action => 'new'
    else
      redirect_to @page
    end
  end
end