class MateriasController < ApplicationController
  respond_to :html, :js, :xml, :json
  # GET /materias
  # GET /materias.json
  def index
    @materias = Materia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materias }
    end
  end

  def buscar
    @materias = Materia.no_asignadas.where("descripcion like ?",'%' + params[:buscar] + '%') unless params.has_key?(:limpiar)
    if @materias.blank?
      @materia = Materia.new; 
      @materia[:descripcion] = params[:buscar] 
    end
    respond_with @materias
  end
  
  # GET /materias/1
  # GET /materias/1.json
  def show
    @materia = Materia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @materia }
    end
  end

  # GET /materias/new
  # GET /materias/new.json
  def new
    @materia = Materia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @materia }
    end
  end

  # GET /materias/1/edit
  def edit
    @materia = Materia.find(params[:id])
  end

  # POST /materias
  # POST /materias.json
  def create
    @materia = Materia.new(params[:materia])
    @materia.save
    @materias = Materia.asignadas(@materia.maestra_id)
    @maestra = @materia.maestra
    respond_with @materia
  end

  # PUT /materias/1
  # PUT /materias/1.json
  def update
    @materia = Materia.find(params[:id])

    respond_to do |format|
      if @materia.update_attributes(params[:materia])
        format.html { redirect_to @materia, notice: 'Materia was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materias/1
  # DELETE /materias/1.json
  def destroy
    @materia = Materia.find(params[:id])
    @materia.destroy

    respond_to do |format|
      format.html { redirect_to materias_url }
      format.json { head :ok }
    end
  end
end
