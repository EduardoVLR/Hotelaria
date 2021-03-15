require "test_helper"

class HospedesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospede = hospedes(:one)
  end

  test "should get index" do
    get hospedes_url
    assert_response :success
  end

  test "should get new" do
    get new_hospede_url
    assert_response :success
  end

  test "should create hospede" do
    assert_difference('Hospede.count') do
      post hospedes_url, params: { hospede: { data_nascimento: @hospede.data_nascimento, email: @hospede.email, nome: @hospede.nome, telefone: @hospede.telefone } }
    end

    assert_redirected_to hospede_url(Hospede.last)
  end

  test "should show hospede" do
    get hospede_url(@hospede)
    assert_response :success
  end

  test "should get edit" do
    get edit_hospede_url(@hospede)
    assert_response :success
  end

  test "should update hospede" do
    patch hospede_url(@hospede), params: { hospede: { data_nascimento: @hospede.data_nascimento, email: @hospede.email, nome: @hospede.nome, telefone: @hospede.telefone } }
    assert_redirected_to hospede_url(@hospede)
  end

  test "should destroy hospede" do
    assert_difference('Hospede.count', -1) do
      delete hospede_url(@hospede)
    end

    assert_redirected_to hospedes_url
  end
end
