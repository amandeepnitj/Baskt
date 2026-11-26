package com.avee.Baskt;

import org.springframework.boot.SpringApplication;

public class TestBasktApplication {

	public static void main(String[] args) {
		SpringApplication.from(BasktApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
