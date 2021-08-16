package com.pradeep.auth.server.service;

import com.pradeep.auth.server.model.AuthUserDetails;
import com.pradeep.auth.server.model.User;
import com.pradeep.auth.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUserName(username);
		System.out.println("inside user details Service");
		if (user == null) {
			throw new UsernameNotFoundException(username + " not found");
		}
		return new AuthUserDetails(user);
	}
}