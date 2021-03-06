createdb:
	docker exec -ti postgres createdb --username=${dbuser} --owner=${dbuser} simple_bank

dropdb:
	docker exec -ti postgres dropdb --username=${dbuser} simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://${dbuser}:${dbpass}@localhost:54322/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://${dbuser}:${dbpass}@localhost:54322/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: createdb dropdb migrateup migratedown sqlc test