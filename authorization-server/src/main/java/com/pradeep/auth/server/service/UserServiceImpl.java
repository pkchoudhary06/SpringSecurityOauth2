package com.pradeep.auth.server.service;

import com.pradeep.auth.server.model.User;

import java.util.List;
import java.util.Optional;

public class UserServiceImpl implements UserService {
	@Override
	public void save(User user) {

	}

	@Override
	public Optional<User> update(int userId, User user) {
		return Optional.empty();
	}

	@Override
	public void delete(int userId) {

	}

	@Override
	public List<User> getUsers() {
		return null;
	}

	@Override
	public Optional<User> getUserById(int userId) {
		return Optional.empty();
	}

	@Override
	public User getUserByUserName(String userName) {
		return null;
	}
}
