class AlumnosController < ApplicationController
  respond_to :html, :js, :xml, :json
  # GET /alumnos
  # GET /alumnos.json
  def index
    @alumnos = Alumno.all
    respond_with @alumnos
  end
  def buscar
    campo = /\d+/.match(params[:buscar]) ? 'documento' : 'nombre'
    @alumnos = Alumno.nuevos.where("#{campo} like ?",'%' + params[:buscar] + '%') unless params.has_key?(:limpiar)
    if @alumnos.blank?
      @alumno = Alumno.new; 
      @alumno[campo.to_sym] = params[:buscar] 
    end
    respond_with @alumnos
  end
  

  # GET /alumnos/1
  # GET /alumnos/1.json
  def show
    @alumno = Alumno.find(params[:id])
    respond_with @alumno
  end

  # GET /alumnos/new
  # GET /alumnos/new.json
  def new
    @alumno = Alumno.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alumno }
    end
  end

  # GET /alumnos/1/edit
  def edit
    @alumno = Alumno.find(params[:id])
  end

  # POST /alumnos
  # POST /alumnos.json
  def create
    @alumno = Alumno.new(params[:alumno])
    @alumno.save
    @alumnos = Alumno.asignados(@alumno.maestra_id)
    @maestra = @alumno.maestra
    respond_with @alumno
  end

  # PUT /alumnos/1
  # PUT /alumnos/1.json
  def update
    @alumno = Alumno.find(params[:id])

    respond_to do |format|
      if @alumno.update_attributes(params[:alumno])
        format.html { redirect_to @alumno, notice: 'Alumno was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnos/1
  # DELETE /alumnos/1.json
  def destroy
    @alumno = Alumno.find(params[:id])
    @alumno.destroy

    respond_to do |format|
      format.html { redirect_to alumnos_url }
      format.json { head :ok }
    end
  end
end
