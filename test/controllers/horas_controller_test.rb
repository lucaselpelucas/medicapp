require 'test_helper'

class HorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hora = horas(:one)
  end

  test "should get index" do
    get horas_index_url, as: :json
    assert_response :success
  end

  test "should create hora" do
    assert_difference('Horas.count') do
      post horas_index_url, params: { hora: { hora: @hora.hora } }, as: :json
    end

    assert_response 201
  end

  test "should show hora" do
    get hora_url(@hora), as: :json
    assert_response :success
  end

  test "should update hora" do
    patch hora_url(@hora), params: { hora: { hora: @hora.hora } }, as: :json
    assert_response 200
  end

  test "should destroy hora" do
    assert_difference('Horas.count', -1) do
      delete hora_url(@hora), as: :json
    end

    assert_response 204
  end
end
