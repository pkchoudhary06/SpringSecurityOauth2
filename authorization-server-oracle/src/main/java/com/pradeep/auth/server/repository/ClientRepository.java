package com.pradeep.auth.server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pradeep.auth.server.model.OAuthClient;


@Repository
public interface ClientRepository extends JpaRepository<OAuthClient, String> {
	OAuthClient findByClientId(String clientId);
}
