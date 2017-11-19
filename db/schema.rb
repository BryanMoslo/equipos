# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171117034630) do

  create_table "opciones", force: :cascade do |t|
    t.integer "idpadre"
    t.string "opcion"
    t.string "url"
    t.string "estadoopcion"
    t.string "orden"
    t.boolean "eshoja"
    t.string "controller"
    t.integer "eliminado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parametros", force: :cascade do |t|
    t.string "atributo"
    t.string "descripcion"
    t.string "estadoParametro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "identification"
    t.string "correo"
    t.integer "idEstado"
    t.integer "idTipo"
    t.integer "idArea"
    t.integer "idCargo"
    t.integer "idTipoIdentificacion"
    t.boolean "eliminado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rol_opcion_operaciones", force: :cascade do |t|
    t.integer "idrol"
    t.integer "idoperacion"
    t.integer "eliminado", default: 0
    t.string "estadorolop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "opcione_id"
    t.integer "usuario_id"
    t.index ["opcione_id"], name: "index_rol_opcion_operaciones_on_opcione_id"
    t.index ["usuario_id"], name: "index_rol_opcion_operaciones_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "usuario"
    t.integer "idrol"
    t.integer "idestadousuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "eliminado", default: 0
    t.string "password"
  end

  create_table "valor_parametros", force: :cascade do |t|
    t.integer "parametroId"
    t.string "valor"
    t.string "orden", limit: 3
    t.string "estadoValorParametro", limit: 1
    t.integer "eliminado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parametro_id"
    t.index ["parametro_id"], name: "index_valor_parametros_on_parametro_id"
  end

end
