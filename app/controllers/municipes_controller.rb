class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update ]

  # GET /municipes or /municipes.json
  def index
    @result = params["/municipe/index"].present? ? query_string(params["/municipe/index"]) : ''
    @municipes = Municipe.joins(:endereco).where(@result).paginate(page: params[:page], per_page: 20).order("id desc")
  end

  def query_string(params)
    result = []
    result << "nome ilike '%#{params[:nome]}%'" if params[:nome].present?
    result << "cpf ilike '%#{params[:cpf]}%'" if params[:cpf].present?
    result << "enderecos.cep ilike '%#{params[:cep]}%'" if params[:cep].present?
    result << "enderecos.codigo_ibge ilike '%#{params[:codigo_ibge]}%'" if params[:codigo_ibge].present?
    result = result.join(" AND ")
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

    respond_to do |format|
      if (params.keys.include?("municipe")) or (params.keys.include?("endereco")) and @municipe.save
        params[:endereco][:municipe_id] = @municipe.id
        @endereco = Endereco.new(endereco_params)
        if (params.keys.include?("endereco"))
          @endereco.save
        end
        UserMailer.body_register_municipe(@municipe.email).deliver
        #UserMailer.body_register_municipe('sanchorodrigues@yahoo.com.br').deliver
        format.html { redirect_to municipe_url(@municipe), notice: "Municipio registrado com sucesso." }
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
    params[:endereco][:municipe_id] = @municipe.id

    respond_to do |format|
      if @municipe.update(municipe_params)
        if (params.keys.include?("endereco"))
          if @endereco.present?
            @endereco.update(endereco_params)
            notice = 'Endereço atualizado com sucesso.'
          else
            @endereco = Endereco.new(endereco_params)
            @endereco.save
            notice = 'Endereço salvo com sucesso.'
          end
        end
        UserMailer.body_register_municipe(@municipe.email).deliver
        format.html { redirect_to municipe_url(@municipe), notice: "Municipio atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
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
