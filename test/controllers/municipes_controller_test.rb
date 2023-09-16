require "test_helper"

class MunicipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @municipe = municipes(:one)
  end

  test "should get index" do
    get municipes_url
    assert_response :success
  end

  test "should get new" do
    get new_municipe_url
    assert_response :success
  end

  test "should create municipe" do
    assert_difference("Municipe.count") do
      post municipes_url, params: { municipe: { cns: @municipe.cns, cpf: @municipe.cpf, data_nascimento: @municipe.data_nascimento, email: @municipe.email, foto: @municipe.foto, nome: @municipe.nome, status: @municipe.status, telefone: @municipe.telefone } }
    end

    assert_redirected_to municipe_url(Municipe.last)
  end

  test "should show municipe" do
    get municipe_url(@municipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_municipe_url(@municipe)
    assert_response :success
  end

  test "should update municipe" do
    patch municipe_url(@municipe), params: { municipe: { cns: @municipe.cns, cpf: @municipe.cpf, data_nascimento: @municipe.data_nascimento, email: @municipe.email, foto: @municipe.foto, nome: @municipe.nome, status: @municipe.status, telefone: @municipe.telefone } }
    assert_redirected_to municipe_url(@municipe)
  end

  test "should destroy municipe" do
    assert_difference("Municipe.count", -1) do
      delete municipe_url(@municipe)
    end

    assert_redirected_to municipes_url
  end
end
