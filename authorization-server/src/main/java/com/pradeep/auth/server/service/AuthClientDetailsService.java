package com.pradeep.auth.server.service;

import com.pradeep.auth.server.model.AuthClient;
import com.pradeep.auth.server.model.AuthClientDetails;
import com.pradeep.auth.server.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.ClientRegistrationException;
import org.springframework.stereotype.Service;

@Service
public class AuthClientDetailsService implements ClientDetailsService {

	@Autowired
	private ClientRepository clientRepository;

	@Override
	public ClientDetails loadClientByClientId(String clientId) throws ClientRegistrationException {
		AuthClient client = clientRepository.findByClientId(clientId);
		if (clientRepository == null) {
			throw new ClientRegistrationException("Client with " + clientId + "not found");
		}
		return new AuthClientDetails(client);
	}
}
