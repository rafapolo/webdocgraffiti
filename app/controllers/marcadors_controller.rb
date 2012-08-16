class MarcadorsController < AdminController
  before_filter :login, :only=>[:edit, :update, :destroy]
  layout false

  def index
    if !request.xhr?
      redirect_to root_path
    else
      render json: Marcador.select("id, titulo, lat, long, bloco_id").all.to_json(:include => :tags)
    end
  end

  def bloco
    if !request.xhr?
      redirect_to root_path
    else
      render json: Marcador.select("id, titulo, lat, long, bloco_id").where("bloco_id = ?", params[:bloco]).to_json(:include => :tags)
    end
  end

  def show
    @marcador = Marcador.find(params[:id])    
      if !request.xhr?
        redirect_to "/mapa"
      else        
        render :layout => false
      end
  end

  def new
    @marcador = Marcador.new

    respond_to do |format|
      format.html
    end
  end

  def edit    
    @marcador = Marcador.find(params[:id])
    render :layout => "admin" unless request.xhr?
  end

  def create
    marcador = params[:marcador]    
    tags = marcador[:tags]
    marcador.delete(:tags)
    @marcador = Marcador.new(marcador)    
    if @marcador.save
      tags.split(",").each do |t|
        @marcador.tags << Tag.find_or_create_by_name(t.strip)          
      end
      begin
        msg = "#{@marcador.titulo}: #{@marcador.info} em http://webdocgraffiti.com.br/mapa/marcador/#{@marcador.id}"
        graph = Koala::Facebook::API.new(session[:token])
        @me = graph.get_object("me")
        puts msg
        graph.put_wall_post(msg)
      rescue Koala::Facebook::APIError
        @me = false
      end     
      render :text=> '200'
    else
      render :text=> '500'
    end
    end

  def update
    @marcador = Marcador.find(params[:id])
    marcador = params[:marcador]
    tags = marcador[:tags]
    marcador.delete(:tags)
    respond_to do |format|
      if @marcador.update_attributes(params[:marcador])
        @marcador.tags.destroy_all
        tags.split(",").each do |t|
          @marcador.tags << Tag.find_or_create_by_name(t.strip)          
        end
        format.html { redirect_to "/admin/marcadores", notice: 'Marcador was successfully updated.' }
      else
        format.html { render request.redirect}
      end
    end
  end

  def destroy
    @marcador = Marcador.find(params[:id])
    @marcador.destroy
    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end
end
