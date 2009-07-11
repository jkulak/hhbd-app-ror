class SearchesController < ApplicationController
  def show
      if params.include?(:q)
        params[:q].gsub!(/<\/?[^>]*>/, "")
        if !params[:q].blank? 
          perform_search
        end
      else
        # fash msg, ze przydalyby sie jakies parametry wyszukiwania i link powrotny
      end
      render :action => "create"
    end

    def perform_search
      @artist_search = Artist.full_search(params[:q])
      # TODO dorobic w wykonawcach wyszukiwanie po nickach! Ośka, O$ka
      @album_search = Album.search(params[:q])
      @label_search = Label.search(params[:q])
      @article_search = Article.search(params[:q])
    end
end