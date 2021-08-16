package com.pradeep.auth.server.repository;

import com.pradeep.auth.server.model.AuthClient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<AuthClient, String> {
	AuthClient findByClientId(String clientId);
}