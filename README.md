# README

Para executar o servidor rails, o comando é "rails serve" ou "rails s"

ENDPOINTS:

listar municipies: "/municipies",
verbo HTTP: GET,
status code: 200 OK

response body: 
{
	[
		{
			"id": 1,
			"full_name": "full_name1",
			"cpf": "12312312311",
			"cns": "MyString1",
			"email": "MyString1@email.com",
			"status": "active",
			"address": {
				"id": 1,
				"cep": "MyString",
				"public_place": "public_place",
				"complement": "MyString",
				"city": "MyString",
				"uf": "MyString",
				"ibge_code": "MyString",
				"municipe_id": 1,
				"neighborhood": "MyString",
				"created_at": "2023-03-22T04:47:11.677Z",
				"updated_at": "2023-03-22T04:47:11.677Z"
			},
			"photo": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c8eb6196ae862dcaad451a7857e3d363d3e60d0c/ruby_symbol.png"
		},
		{
			"id": 2,
			"full_name": "full_name2",
			"cpf": "12312312312",
			"cns": "MyString2",
			"email": "MyString2@email.com",
			"status": "active",
			"address": {
				"id": 2,
				"cep": "MyString",
				"public_place": "public_place",
				"complement": "MyString",
				"city": "MyString",
				"uf": "MyString",
				"ibge_code": "MyString",
				"municipe_id": 2,
				"neighborhood": "MyString",
				"created_at": "2023-03-22T04:47:11.685Z",
				"updated_at": "2023-03-22T04:47:11.685Z"
			},
			"photo": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0f9ce0c209fa951dfeb9606c11272cdca9f87c66/ruby_symbol.png"
		}
  ]
}

------------------------------------------------------------------------------------------------------------------------------------------------

criar municipe: "/municipies",
verbo HTTP: POST
status code: 201 created

request body:
{
	"municipe": {
		"full_name": "John doe",
		"cpf": "123123123123",
		"cns": "12312311231",
		"email": "johndoe@email.com",
		"photo": "",
		"phone_number": "82932121232",
		"birth_date": "1973-12-23",
		"address_attributes": {
			"cep": "12123123",
			"public_place": "myString1",
			"complement": "house",
			"city": "chicago",
			"uf": "illinois",
			"ibge_code": "132654789",
			"neighborhood": "myString1"
		}
	}
}


response body: 
{
	{
		"id": 1,
		"full_name": "full_name1",
		"cpf": "12312312311",
		"cns": "MyString1",
		"email": "MyString1@email.com",
		"status": "active",
		"phone_number": "MyString1",
		"birth_date": "2023-03-17",
		"address": {
      "id": 1,
      "cep": "MyString",
      "public_place": "public_place",
      "complement": "MyString",
      "city": "MyString",
      "uf": "MyString",
      "ibge_code": "MyString",
      "municipe_id": 1,
      "neighborhood": "MyString",
      "created_at": "2023-03-22T05:00:44.765Z",
      "updated_at": "2023-03-22T05:00:44.765Z"
    },
		"photo": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c8eb6196ae862dcaad451a7857e3d363d3e60d0c/ruby_symbol.png"
	}
}

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Visualizar municipe: "/municipies/:id"
verbo HTTP: GET
status code: 200 OK

response body: 
{
	{
		"id": 1,
		"full_name": "full_name1",
		"cpf": "12312312311",
		"cns": "MyString1",
		"email": "MyString1@email.com",
		"status": "active",
    "phone_number": "82932121232",
		"birth_date": "1973-12-23",
		"address": {
			"id": 1,
			"cep": "MyString",
			"public_place": "public_place",
			"complement": "MyString",
			"city": "MyString",
			"uf": "MyString",
			"ibge_code": "MyString",
			"municipe_id": 1,
			"neighborhood": "MyString",
			"created_at": "2023-03-22T04:47:11.677Z",
			"updated_at": "2023-03-22T04:47:11.677Z"
		},
		"photo": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c8eb6196ae862dcaad451a7857e3d363d3e60d0c/ruby_symbol.png"
	},
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Editar municipe: "/municipies/:id"
verbo HTTP: PUT
status code: 204 no_content

request body:
{
	"municipe": {
		"full_name": "John doe",
		"cpf": "123123123123",
		"cns": "12312311231",
		"email": "johndoe@email.com",
    "phone_number": "82932121232",
		"birth_date": "1973-12-23",
		"photo": "",
		"address_attributes": {
			"cep": "12123123",
			"public_place": "myString1",
			"complement": "house",
			"city": "chicago",
			"uf": "illinois",
			"ibge_code": "132654789",
			"neighborhood": "myString1"
		}
	}
}