package com.grocery.manage.repository;

import org.springframework.data.repository.CrudRepository;

import com.grocery.manage.entities.Admin;

public interface AdminRepository extends CrudRepository<Admin, String> {

}
