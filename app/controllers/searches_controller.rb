class SearchesController < ApplicationController
  def show
      if params.include?(:q)
        perform_search
      else
        # fash msg, ze przydalyby sie jakies parametry wyszukiwania i link powrotny
      end
      render :action => "create"
    end

    def perform_search
      @artist_search = Artist.search(params[:q])
      # TODO dorobic w wykonawcach wyszukiwanie po nickach! Ośka, O$ka
      # @album_search = Album.search(params[:q])
      # @label_search = Label.search(params[:q])
      # @article_search = Artilcle.search(params[:q])
    end
end