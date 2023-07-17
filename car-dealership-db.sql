CREATE TABLE Vehicle (
	vehicle_id SERIAL primary key,
	"condition" char(4) NOT NULL,
	serial_number char(17) UNIQUE NOT NULL,
	"year" int NOT NULL,
	make varchar NOT NULL,
	model varchar NOT NULL,
	trim varchar NOT NULL,
	color varchar NOT NULL,
	salesperson_id int NOT NULL,
	customer_id int NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
);
ALTER TABLE vehicle 
ADD CONSTRAINT serial_number UNIQUE (serial_number);

CREATE TABLE Customer (
	customer_id SERIAL primary key,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	email varchar NOT NULL,
	phone_number int NOT NULL,
	address varchar NOT NULL,
	city varchar NOT NULL,
	state varchar NOT NULL,
	zip_code int NOT NULL
);

CREATE TABLE Salesperson (
	salesperson_id SERIAL primary key,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL
);

CREATE TABLE Invoice (
	invoice_id SERIAL primary key,
	salesperson_id int NOT NULL,
	customer_id int NOT NULL,
	vehicle_id int NOT NULL,
	amount decimal NOT NULL,
	"date" date NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);

CREATE TABLE Service (
	ticket_id SERIAL primary key,
	service_type varchar NOT NULL,
	serial_number char(17) NOT NULL,
	mechanic_id int NOT NULL,
	customer_id int NOT NULL,
	amount decimal NOT NULL,
	date_recieved timestamp NOT NULL,
	date_returned timestamp NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (serial_number) REFERENCES vehicle(serial_number),
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE Mechanic (
	mechanic_id SERIAL primary key,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL
);