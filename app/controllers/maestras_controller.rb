class MaestrasController < ApplicationController
  respond_to :html, :js, :xml, :json
  # GET /maestras
  # GET /maestras.json
  def index
    @maestras = Maestra.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maestras }
    end
  end

  # GET /maestras/1
  # GET /maestras/1.json
  def show
    @maestra = Maestra.find(params[:id])
    @alumnos = @maestra.alumnos.ordered
    respond_with @maestra
  end

  def agregar_alumno
    @maestra = Maestra.find(params[:id])
    @alumno = Alumno.find(params[:alumno_id])
    @alumno.update_attributes(maestra_id: @maestra)
    @alumnos = @maestra.alumnos
    respond_to do |format|
      format.js {render 'accion_alumno'}
    end
  end

  def desagregar_alumno
    @maestra = Maestra.find(params[:id])
    alumno = @maestra.alumnos.find(params[:alumno_id])
    alumno.update_attributes(maestra_id: nil)
    @alumnos = @maestra.alumnos
    respond_to do |format|
      format.js {render 'accion_alumno'}
    end
  end  
  
  # GET /maestras/new
  # GET /maestras/new.json
  def new
    @maestra = Maestra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maestra }
    end
  end

  # GET /maestras/1/edit
  def edit
    @maestra = Maestra.find(params[:id])
  end

  # POST /maestras
  # POST /maestras.json
  def create
    @maestra = Maestra.new(params[:maestra])

    respond_to do |format|
      if @maestra.save
        format.html { redirect_to @maestra, notice: 'Maestra was successfully created.' }
        format.json { render json: @maestra, status: :created, location: @maestra }
      else
        format.html { render action: "new" }
        format.json { render json: @maestra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maestras/1
  # PUT /maestras/1.json
  def update
    @maestra = Maestra.find(params[:id])

    respond_to do |format|
      if @maestra.update_attributes(params[:maestra])
        format.html { redirect_to @maestra, notice: 'Maestra was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @maestra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maestras/1
  # DELETE /maestras/1.json
  def destroy
    @maestra = Maestra.find(params[:id])
    @maestra.destroy

    respond_to do |format|
      format.html { redirect_to maestras_url }
      format.json { head :ok }
    end
  end
end
