package com.pradeep.auth.server.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.provider.ClientDetails;

public class OAuthClientDetails implements ClientDetails {
	
	private static final long serialVersionUID = -5294562011836131914L;
	private OAuthClient client;
	public OAuthClientDetails(OAuthClient client) {
		this.client = client;
	}

	@Override
  	public Integer getAccessTokenValiditySeconds() {
		return this.client.getAccessTokenValidity();
	}
	@Override
	public Map<String, Object> getAdditionalInformation() {
		return null;
	}
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> ga = new ArrayList<GrantedAuthority>();
		ga.add(new SimpleGrantedAuthority("ROLE_CLIENT"));
		return ga;
	}
	@Override
	public Set<String> getAuthorizedGrantTypes() {
		String[] grantTypeArray = this.client.getAuthorizedGrantTypes().split(",");
		Set<String> grantTypes = new HashSet<String>();
		for (String grantType : grantTypeArray)
			grantTypes.add(grantType);
		return grantTypes;
	}
	@Override
	public String getClientId() {
		return this.client.getClientId();
	}
	@Override
	public String getClientSecret() {
		return this.client.getClientSecret();
	}
	@Override
	public Integer getRefreshTokenValiditySeconds() {
		return this.client.getRefreshTokenValidity();
	}
	@Override
	public Set<String> getRegisteredRedirectUri() {
		String[] uriArray = this.client.getWebServerRedirectUri().split(",");
		Set<String> uris = new HashSet<String>();
		for (String uri : uriArray)
			uris.add(uri);
		return uris;
	}
	@Override
	public Set<String> getResourceIds() {
		if(this.client.getResourceIds()==null) {
			return new HashSet<>();
		}
		String[] resourceArray = this.client.getResourceIds().split(",");
		Set<String> resources = new HashSet<String>();
		for (String resource : resourceArray)
			resources.add(resource);
		return resources;
	}
	@Override
	public Set<String> getScope() {
		String[] scopeArray = this.client.getScope().split(",");
		Set<String> scopes = new HashSet<String>();
		for (String scope : scopeArray)
			scopes.add(scope);
		return scopes;
	}
	@Override
	public boolean isAutoApprove(String arg0) {
		return false;
	}
	@Override
	public boolean isScoped() {
		return true;
	}
	@Override
	public boolean isSecretRequired() {
		return true;
	}
}
