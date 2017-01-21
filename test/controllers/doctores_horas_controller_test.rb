require 'test_helper'

class DoctoresHorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctores_hora = doctores_horas(:one)
  end

  test "should get index" do
    get doctores_horas_index_url, as: :json
    assert_response :success
  end

  test "should create doctores_hora" do
    assert_difference('DoctoresHoras.count') do
      post doctores_horas_index_url, params: { doctores_hora: { doctores_id_id: @doctores_hora.doctores_id_id, horas_id_id: @doctores_hora.horas_id_id } }, as: :json
    end

    assert_response 201
  end

  test "should show doctores_hora" do
    get doctores_hora_url(@doctores_hora), as: :json
    assert_response :success
  end

  test "should update doctores_hora" do
    patch doctores_hora_url(@doctores_hora), params: { doctores_hora: { doctores_id_id: @doctores_hora.doctores_id_id, horas_id_id: @doctores_hora.horas_id_id } }, as: :json
    assert_response 200
  end

  test "should destroy doctores_hora" do
    assert_difference('DoctoresHoras.count', -1) do
      delete doctores_hora_url(@doctores_hora), as: :json
    end

    assert_response 204
  end
end
