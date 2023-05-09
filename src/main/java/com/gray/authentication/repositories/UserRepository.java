package com.gray.authentication.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.gray.authentication.models.User;

public interface UserRepository extends CrudRepository<User, Long>{

	Optional<User> findByEmail(String email);
}
