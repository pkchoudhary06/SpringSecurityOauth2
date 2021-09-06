package com.pradeep.auth.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.ClientRegistrationException;
import org.springframework.stereotype.Service;

import com.pradeep.auth.server.model.OAuthClient;
import com.pradeep.auth.server.model.OAuthClientDetails;
import com.pradeep.auth.server.repository.ClientRepository;


@Service
public class OAuthClientDetailsService implements ClientDetailsService {

	@Autowired
	private ClientRepository clientRepository;

	@Override
	public ClientDetails loadClientByClientId(String clientId) throws ClientRegistrationException {
		OAuthClient client = clientRepository.findByClientId(clientId);
		if (client == null) {
			throw new ClientRegistrationException("Client not found");
		}
		return new OAuthClientDetails(client);
	}

}
