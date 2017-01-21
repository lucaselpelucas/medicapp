require 'test_helper'

class AdministrativosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrativo = administrativos(:one)
  end

  test "should get index" do
    get administrativos_index_url, as: :json
    assert_response :success
  end

  test "should create administrativo" do
    assert_difference('Administrativos.count') do
      post administrativos_index_url, params: { administrativo: { centros_id_id: @administrativo.centros_id_id, nip: @administrativo.nip, nombre: @administrativo.nombre, permiso: @administrativo.permiso, usuario: @administrativo.usuario } }, as: :json
    end

    assert_response 201
  end

  test "should show administrativo" do
    get administrativo_url(@administrativo), as: :json
    assert_response :success
  end

  test "should update administrativo" do
    patch administrativo_url(@administrativo), params: { administrativo: { centros_id_id: @administrativo.centros_id_id, nip: @administrativo.nip, nombre: @administrativo.nombre, permiso: @administrativo.permiso, usuario: @administrativo.usuario } }, as: :json
    assert_response 200
  end

  test "should destroy administrativo" do
    assert_difference('Administrativos.count', -1) do
      delete administrativo_url(@administrativo), as: :json
    end

    assert_response 204
  end
end
