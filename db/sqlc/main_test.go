package db

import (
	"database/sql"
	"log"
	"testing"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://admindb:adminpass@localhost:54322/simple_bank?sslmode=disable"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	testQueries = New(conn)
}
