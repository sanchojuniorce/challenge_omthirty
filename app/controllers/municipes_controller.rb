class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update destroy ]

  # GET /municipes or /municipes.json
  def index
    @municipes = Municipe.all
  end

  # GET /municipes/1 or /municipes/1.json
  def show
  end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
  end

  # GET /municipes/1/edit
  def edit
  end

  # POST /municipes or /municipes.json
  def create
    @municipe = Municipe.new(municipe_params)
    @endereco = Endereco.new(endereco_params)

    respond_to do |format|
      if (params.keys.include?("municipe")) or (params.keys.include?("endereco"))
        if @municipe.save
          if (params.keys.include?("endereco"))
            params[:endereco][:municipe_id] = @municipe.id
            @endereco.save
          end
        end  
        format.html { redirect_to municipe_url(@municipe), notice: "Municipe was successfully created." }
        format.json { render :show, status: :created, location: @municipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update
    @endereco = Endereco.find_by_municipe_id(@municipe.id)

    respond_to do |format|
      if @municipe.update(municipe_params)
        if (params.keys.include?("endereco"))
          if @endereco.present?
            @endereco.update(endereco_params)
            notice = 'Endereço atualizado com sucesso.'
          else
            @endereco = Endereco.new(endereco_params)
            params[:endereco][:municipe_id] = @municipe.id
            @endereco.save
            notice = 'Endereço salvo com sucesso.'
          end
        end
        format.html { redirect_to municipe_url(@municipe), notice: "Municipe was successfully updated." }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipes/1 or /municipes/1.json
  def destroy
    @municipe.destroy

    respond_to do |format|
      format.html { redirect_to municipes_url, notice: "Municipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipe
      @municipe = Municipe.find(params[:id])
      @endereco = Endereco.find_by_municipe_id(@municipe.id)
    end

    # Only allow a list of trusted parameters through.
    def municipe_params
      if params[:municipe].present?
        params.require(:municipe).permit(:nome, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status)
      elsif params[:endereco].present?  
        params.require(:endereco).permit(:cep, :logradouro, :complemento, :bairro, :cidade, :uf, :codigo_ibge, :municipe_id)
      end
    end

    def endereco_params
      params.require(:endereco).permit(:cep, :logradouro, :complemento, :bairro, :cidade, :uf, :codigo_ibge, :municipe_id)
    end
end
