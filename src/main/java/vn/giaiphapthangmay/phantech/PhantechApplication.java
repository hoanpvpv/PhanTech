package vn.giaiphapthangmay.phantech;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// (exclude=org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
@SpringBootApplication
public class PhantechApplication {

	public static void main(String[] args) {
		SpringApplication.run(PhantechApplication.class, args);
	}

}
